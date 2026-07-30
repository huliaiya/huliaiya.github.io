#!/bin/env bash
set -euo pipefail

G="\033[32m"; R="\033[31m"; Y="\033[33m"; C="\033[36m"; B="\033[1m"; D="\033[2m"; N="\033[0m"
BAR_W=20

emit() {
  local color="$1" tag="$2"; shift 2
  printf "  ${color}%-4s${N} %s\n" "$tag" "$*"
}

ok()   { emit "$G" "OK"   "$*"; }
skip() { emit "$Y" "SKIP" "$*"; }
warn() { emit "$Y" "WARN" "$*"; }
info() { emit "$C" "INFO" "$*"; }
fail() { emit "$R" "FAIL" "$*"; exit 1; }

bar() {
  local done="$1" total="$2" cur="${3:-0}" pct filled empty i s=""
  [ "$total" -le 0 ] && total=1
  filled=$((done * BAR_W / total))
  empty=$((BAR_W - filled - cur))
  [ "$empty" -lt 0 ] && empty=0
  for ((i=0; i<filled; i++)); do s+="#"; done
  [ "$cur" = 1 ] && s+=">"
  for ((i=0; i<empty; i++)); do s+="-"; done
  pct=$(( (done + cur) * 100 / total ))
  [ "$pct" -gt 100 ] && pct=100
  printf "${C}[%s]${N} %3d%%" "$s" "$pct"
}

step() {
  ST=$((ST + 1))
  printf "\n  ${B}${C}== [%d/%d] %s${N}\n" "$ST" "$TOTAL" "$*"
  printf "    "
  bar "$((ST - 1))" "$TOTAL"
  printf "\n"
}

run() {
  local retry=1 allow=0
  while [ "${1:-}" = "--retry" ] || [ "${1:-}" = "--allow-fail" ]; do
    case "$1" in
      --retry) retry="$2"; shift 2 ;;
      --allow-fail) allow=1; shift ;;
    esac
  done
  local msg="$1"; shift
  local log rc attempt ch i
  local spin=('|' '/' '-' '\')
  log="$(mktemp)"
  for attempt in $(seq 1 "$retry"); do
    local rtag=""
    [ "$attempt" -gt 1 ] && rtag=" (重试 $attempt/$retry)"
    ( "$@" ) >"$log" 2>&1 &
    local pid=$!
    i=0
    while kill -0 "$pid" 2>/dev/null; do
      ch="${spin[i%4]}"
      printf "\r\033[K    ${Y}%-4s${N} " "$ch"
      bar "$((ST - 1))" "$TOTAL" 1
      printf " ${C}%s${N}%s" "$msg" "$rtag"
      i=$((i + 1)); sleep 0.1
    done
    rc=0; wait "$pid" || rc=$?
    [ "$rc" -eq 0 ] && break
    [ "$attempt" -lt "$retry" ] && sleep 1
  done
  printf "\r\033[K"
  if [ "$rc" -eq 0 ]; then
    ok "$msg"
  elif [ "$allow" -eq 1 ]; then
    skip "$msg"
  else
    emit "$R" "FAIL" "$msg"
    printf "  ${D}-- 输出末尾 --${N}\n"
    tail -n 6 "$log" | sed 's/^/    /'
    rm -f "$log"
    return "$rc"
  fi
  rm -f "$log"
  return 0
}

die() {
  printf "\n"
  emit "$R" "FAIL" "$1"
  printf "  ${Y}已重试 %d 次仍失败，建议:${N}\n" "${2:-3}"
  printf "    - 检查或切换网络后重新执行本脚本\n"
  printf "    - 确认软件源可达 (镜像 / 官方源)\n"
  printf "    - 排除代理 / DNS / 存储空间等问题\n"
  exit 1
}

cleanup() {
  rm -f /etc/apt/sources.list.d/debian-chromium.list \
        /etc/apt/preferences.d/debian-chromium 2>/dev/null || true
  apt-get update -qq 2>/dev/null || true
}
trap cleanup EXIT

check_snap() {
  local bin="$1"
  [ -f "$bin" ] || return 1
  grep -q snap "$bin" 2>/dev/null && return 1
  return 0
}

resolve_deps() {
  local deps count
  deps=$(apt-cache depends --recurse --no-recommends --no-suggests \
    --no-conflicts --no-breaks --no-replaces --no-enhances chromium 2>/dev/null \
    | grep '^\w' | grep -v '^<' | sort -u)
  count=$(echo "$deps" | grep -c .)
  [ "$count" -eq 0 ] && return 1
  {
    echo "Package: *"
    echo "Pin: release o=Debian"
    echo "Pin-Priority: 50"
    echo ""
    echo "$deps" | while IFS= read -r pkg; do
      [ -n "$pkg" ] || continue
      printf "Package: %s\nPin: release o=Debian\nPin-Priority: 1001\n\n" "$pkg"
    done
  } > /etc/apt/preferences.d/debian-chromium
  info "已解析 $count 个依赖包并设置高优先级"
  return 0
}

[ "$(id -u)" -eq 0 ] || fail "请用 sudo 运行"
. /etc/os-release 2>/dev/null || true
case "${ID:-}" in ubuntu|debian) ;; *) fail "仅支持 Ubuntu / Debian" ;; esac
ARCH="$(dpkg --print-architecture 2>/dev/null || uname -m)"

printf "\n  ${B}${G}==============================${N}\n"
printf "  ${B}${G}    Chromium 安装工具${N}\n"
printf "  ${B}${G}==============================${N}\n"
printf "  ${D}系统${N} %s (%s)\n" "$PRETTY_NAME" "$ARCH"

printf "\n  ${B}请选择操作:${N}\n"
printf "    ${C}1${N}) 安装  (卸载旧版 + 安装最新)\n"
printf "    ${C}2${N}) 更新  (升级到最新版)\n"

IS_PIPE=false
if [ ! -t 0 ]; then
  IS_PIPE=true
  printf "  ${D}[检测到管道模式，默认执行安装]${N}\n"
fi

if $IS_PIPE; then
  choice=1
else
  printf "  ${D}请输入 [1/2] (默认 1):${N} "
  if ! read -r -t 30 choice; then
    choice=1
    printf "1\n"
  fi
fi
case "${choice:-1}" in
  1) MODE=install ;;
  2) MODE=update ;;
  *) fail "无效选择，请输入 1 或 2" ;;
esac

if [ "$MODE" = update ]; then
  BIN="$(command -v chromium 2>/dev/null || true)"
  if [ -z "$BIN" ] || grep -q snap "$BIN" 2>/dev/null; then
    info "未检测到有效的 Chromium，转为安装模式"
    MODE=install
  fi
fi

if [ "$MODE" = install ]; then TOTAL=4; else TOTAL=3; fi
ST=0

if [ "$MODE" = install ]; then
  step "卸载旧版本"
  apt-mark unhold chromium >/dev/null 2>&1 || true
  run --allow-fail "apt 移除 chromium-browser / chromium" apt-get remove -y chromium-browser chromium
  if command -v snap >/dev/null 2>&1; then
    run --allow-fail "snap 移除 chromium" snap remove chromium
  else
    skip "snap 移除 chromium"
  fi
  rm -f /etc/apt/sources.list.d/chromium*.list /etc/apt/sources.list.d/debian*.list \
        /etc/apt/preferences.d/chromium* /etc/apt/preferences.d/debian* 2>/dev/null || true
fi

step "配置软件源"
IS_CN=false
curl -sL --connect-timeout 3 ipinfo.io/json 2>/dev/null | grep -q '"CN"' && IS_CN=true || true
if $IS_CN; then
  MIRROR="https://mirrors.ustc.edu.cn/debian"; SEC="https://mirrors.ustc.edu.cn/debian-security"
  info "国内网络，使用 USTC 镜像"
else
  MIRROR="https://deb.debian.org/debian"; SEC="https://security.debian.org/debian-security"
  info "国外网络，使用 Debian 官方源"
fi
{
  echo "deb [trusted=yes] ${MIRROR} bookworm main"
  echo "deb [trusted=yes] ${SEC} bookworm-security main"
} > /etc/apt/sources.list.d/debian-chromium.list
ok "写入 Debian 源"
run --retry 3 "apt-get update" apt-get update || die "apt-get update 失败" 3

step "解析依赖并设置优先级"
printf 'Package: chromium-browser\nPin: origin ""\nPin-Priority: -1\n' > /etc/apt/preferences.d/block-snap-chromium
if resolve_deps; then
  ok "依赖解析完成，优先级已设置"
else
  warn "依赖解析失败，使用基础优先级"
  cat > /etc/apt/preferences.d/debian-chromium << 'EOF'
Package: *
Pin: release o=Debian
Pin-Priority: 50

Package: chromium
Pin: release o=Debian
Pin-Priority: 1001

Package: chromium-common
Pin: release o=Debian
Pin-Priority: 1001

Package: libjpeg62-turbo
Pin: release o=Debian
Pin-Priority: 1001
EOF
fi
ok "屏蔽 snap 版 chromium-browser"

step "$([ "$MODE" = install ] && echo '安装 Chromium' || echo '升级 Chromium')"
apt-mark unhold chromium >/dev/null 2>&1 || true
if [ "$MODE" = install ]; then
  run --retry 3 "apt-get install chromium" apt-get install -y --no-install-recommends chromium \
    || die "安装 Chromium 失败" 3
else
  run --retry 3 "apt-get upgrade chromium" apt-get install -y --only-upgrade chromium \
    || die "升级 Chromium 失败" 3
fi

BIN="$(command -v chromium 2>/dev/null || true)"
if [ -z "$BIN" ]; then
  warn "未找到 chromium 可执行文件"
  exit 1
fi

printf "\n  ${B}${C}== 验证安装结果 ==${N}\n"

VOUT="$(chromium --version 2>/dev/null || true)"
if [ -n "$VOUT" ]; then
  ok "版本检查: $VOUT"
else
  fail "版本检查: 无法获取版本号"
fi

if [ -f "$BIN" ]; then
  ok "路径检查: $BIN"
else
  warn "路径检查: $BIN 不存在"
fi

if check_snap "$BIN"; then
  ok "来源检查: 非 snap 版本"
else
  warn "来源检查: 疑似 snap 版本"
fi

if timeout 15 "$BIN" --headless --no-sandbox --disable-gpu --dump-dom about:blank >/dev/null 2>&1; then
  ok "运行测试: headless 模式正常"
else
  warn "运行测试: headless 模式失败"
fi

apt-mark hold chromium >/dev/null 2>&1 || true
ok "版本锁定: 已 hold，防止系统更新破坏"

printf "\n  ${C}[####################] 100%%${N}\n"
printf "  ${B}${G}>> %s完成 <<${N}\n" "$([ "$MODE" = install ] && echo '安装' || echo '更新')"
printf "  ${D}再次运行本脚本可卸载旧版并升级到最新${N}\n\n"
exit 0
