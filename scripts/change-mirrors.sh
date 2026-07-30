#!/bin/bash


mirror_list_default=(
    "mirrors.aliyun.com"
    "mirrors.tencent.com"
    "mirrors.huaweicloud.com"
    "mirrors.cmecloud.cn"
    "mirrors.ctyun.cn"
    "mirrors.163.com"
    "mirrors.volces.com"
    "mirrors.tuna.tsinghua.edu.cn"
    "mirrors.pku.edu.cn"
    "mirrors.zju.edu.cn"
    "mirrors.nju.edu.cn"
    "mirror.lzu.edu.cn"
    "mirror.sjtu.edu.cn"
    "mirrors.hust.edu.cn"
    "mirrors.ustc.edu.cn"
    "mirror.iscas.ac.cn"
    "mirrors.cstcloud.cn"
    "__OFFICIAL_SOURCE_TAG__"
)
mirror_list_edu=(
    "mirrors.pku.edu.cn"
    "mirror.bjtu.edu.cn"
    "mirrors.bfsu.edu.cn"
    "mirrors.bupt.edu.cn"
    "mirrors.cqu.edu.cn"
    "mirrors.cqupt.edu.cn"
    "mirrors.neusoft.edu.cn"
    "mirrors.uestc.cn"
    "mirrors.scau.edu.cn"
    "mirrors.hust.edu.cn"
    "mirrors.jlu.edu.cn"
    "mirrors.jcut.edu.cn"
    "mirrors.jxust.edu.cn"
    "mirror.lzu.edu.cn"
    "mirrors.nju.edu.cn"
    "mirrors.njtech.edu.cn"
    "mirrors.njupt.edu.cn"
    "mirrors.sustech.edu.cn"
    "mirror.nyist.edu.cn"
    "mirrors.qlu.edu.cn"
    "mirrors.tuna.tsinghua.edu.cn"
    "mirrors.sdu.edu.cn"
    "mirrors.shanghaitech.edu.cn"
    "mirror.sjtu.edu.cn"
    "mirrors.sjtug.sjtu.edu.cn"
    "mirrors.wsyu.edu.cn"
    "mirrors.xjtu.edu.cn"
    "mirrors.nwafu.edu.cn"
    "mirrors.zju.edu.cn"
    "mirrors.ustc.edu.cn"
    "__OFFICIAL_SOURCE_TAG__"
)
mirror_list_abroad=(
    "mirrors.xtom.hk"
    "mirror.01link.hk"
    "download.nus.edu.sg/mirror"
    "mirror.sg.gs"
    "mirrors.xtom.sg"
    "free.nchc.org.tw"
    "mirror.ossplanet.net"
    "linux.cs.nycu.edu.tw"
    "ftp.tku.edu.tw"
    "mirror.twds.com.tw"
    "mirror.anigil.com"
    "ftp.udx.icscoe.jp/Linux"
    "ftp.jaist.ac.jp/pub/Linux"
    "linux2.yz.yamagata-u.ac.jp/pub/Linux"
    "mirrors.xtom.jp"
    "mirrors.gbnetwork.com"
    "mirror.kku.ac.th"
    "mirror.vorboss.net"
    "mirror.quickhost.uk"
    "mirror.dogado.de"
    "mirrors.xtom.de"
    "ftp.halifax.rwth-aachen.de"
    "ftp.agdsn.de"
    "mirror.in2p3.fr/pub/linux"
    "mirrors.ircam.fr/pub"
    "eclats.crans.org"
    "ftp.crihan.fr"
    "mirrors.xtom.nl"
    "mirror.datapacket.com"
    "eu.edge.kernel.org"
    "mirrors.xtom.ee"
    "mirror.netsite.dk"
    "mirrors.dotsrc.org"
    "mirror.accum.se"
    "ftp.lysator.liu.se"
    "mirror.yandex.ru"
    "mirror.linux-ia64.org"
    "mirror.truenetwork.ru"
    "ftp.belnet.be/mirror"
    "ftp.cc.uoc.gr/mirrors/linux"
    "ftp.fi.muni.cz/pub/linux"
    "ftp.sh.cvut.cz"
    "mirror.karneval.cz/pub/linux"
    "mirrors.nic.cz"
    "mirror.ethz.ch"
    "mirrors.kernel.org"
    "mirrors.mit.edu"
    "mirror.math.princeton.edu/pub"
    "ftp-chi.osuosl.org/pub"
    "mirror.fcix.net"
    "mirrors.xtom.com"
    "mirror.steadfast.net"
    "mirror.it.ubc.ca"
    "mirror.xenyth.net"
    "mirrors.switch.ca"
    "mirror.pop-sc.rnp.br/mirror"
    "mirror.uepg.br"
    "mirror.ufscar.br"
    "mirrors.eze.sysarmy.com"
    "gsl-syd.mm.fcix.net"
    "mirror.aarnet.edu.au/pub"
    "mirror.datamossa.io"
    "mirror.amaze.com.au"
    "mirrors.xtom.au"
    "mirror.overthewire.com.au"
    "mirror.fsmg.org.nz"
    "mirror.liquidtelecom.com"
    "mirror.dimensiondata.com"
    "__OFFICIAL_SOURCE_TAG__"
)

mirror_list_extranet=(
    "mirrors.aliyun.com"
    "mirrors.tencent.com"
    "mirrors.huaweicloud.com"
    "mirrors.ctyun.cn"
    "mirrors.volces.com"
)
mirror_list_intranet=(
    "mirrors.cloud.aliyuncs.com"
    "mirrors.tencentyun.com"
    "mirrors.myhuaweicloud.com"
    "internal.mirrors.ctyun.cn"
    "mirrors.ivolces.com"
)


SYSTEM_DEBIAN="Debian"
SYSTEM_UBUNTU="Ubuntu"
SYSTEM_KALI="Kali"
SYSTEM_DEEPIN="Deepin"
SYSTEM_LINUX_MINT="Linuxmint"
SYSTEM_ZORIN="Zorin"
SYSTEM_RASPBERRY_PI_OS="Raspberry Pi OS"
SYSTEM_REDHAT="RedHat"
SYSTEM_RHEL="Red Hat Enterprise Linux"
SYSTEM_CENTOS="CentOS"
SYSTEM_CENTOS_STREAM="CentOS Stream"
SYSTEM_ROCKY="Rocky"
SYSTEM_ALMALINUX="AlmaLinux"
SYSTEM_FEDORA="Fedora"
SYSTEM_ORACLE="Oracle Linux"
SYSTEM_OPENCLOUDOS="OpenCloudOS"
SYSTEM_OPENCLOUDOS_STREAM="OpenCloudOS Stream"
SYSTEM_TENCENTOS="TencentOS"
SYSTEM_OPENEULER="openEuler"
SYSTEM_ANOLISOS="Anolis"
SYSTEM_KYLIN_DESKTOP="Kylin Desktop"
SYSTEM_KYLIN_SERVER="Kylin Server"
SYSTEM_OPENKYLIN="openKylin"
SYSTEM_OPENSUSE="openSUSE"
SYSTEM_ARCH="Arch"
SYSTEM_MANJARO="Manjaro"
SYSTEM_ALPINE="Alpine"
SYSTEM_GENTOO="Gentoo"
SYSTEM_NIXOS="NixOS"
SYSTEM_VOID="Void"

File_LinuxRelease=/etc/os-release
File_RedHatRelease=/etc/redhat-release
File_DebianVersion=/etc/debian_version
File_ArmbianRelease=/etc/armbian-release
File_RaspberryPiOSRelease=/etc/rpi-issue
File_openEulerRelease=/etc/openEuler-release
File_HuaweiCloudEulerOSRelease=/etc/hce-release
File_OpenCloudOSRelease=/etc/opencloudos-release
File_TencentOSServerRelease=/etc/tlinux-release
File_AnolisOSRelease=/etc/anolis-release
File_AlibabaCloudLinuxRelease=/etc/alinux-release
File_OracleLinuxRelease=/etc/oracle-release
File_ArchLinuxRelease=/etc/arch-release
File_ManjaroRelease=/etc/manjaro-release
File_AlpineRelease=/etc/alpine-release
File_GentooRelease=/etc/gentoo-release
File_KylinRelease=/etc/kylin-release
File_kylinVersion=/etc/kylin-version/kylin-system-version.conf
File_ProxmoxVersion=/etc/pve/.version

Dir_AptAdditionalSources=/etc/apt/sources.list.d
Dir_AptAdditionalSourcesBackup=$Dir_AptAdditionalSources.bak
Dir_YumRepos=/etc/yum.repos.d
Dir_YumReposBackup=$Dir_YumRepos.bak
Dir_ZYppRepos=/etc/zypp/repos.d
Dir_ZYppReposBackup=$Dir_ZYppRepos.bak
Dir_GentooReposConf=/etc/portage/repos.conf
Dir_NixConfig=/etc/nix
Dir_XbpsRepos=/etc/xbps.d
Dir_XbpsReposBackup=$Dir_XbpsRepos.bak
File_AptSourceList=/etc/apt/sources.list
File_AptSourceListBackup=$File_AptSourceList.bak
File_DebianSources=$Dir_AptAdditionalSources/debian.sources
File_DebianSourcesBackup=$File_DebianSources.bak
File_UbuntuSources=$Dir_AptAdditionalSources/ubuntu.sources
File_UbuntuSourcesBackup=$File_UbuntuSources.bak
File_ArmbianSourceList=$Dir_AptAdditionalSources/armbian.list
File_ArmbianSourceListBackup=$File_ArmbianSourceList.bak
File_ProxmoxSourceList=$Dir_AptAdditionalSources/pve-no-subscription.list
File_ProxmoxSourceListBackup=$File_ProxmoxSourceList.bak
File_ProxmoxSources=$Dir_AptAdditionalSources/pve-no-subscription.sources
File_ProxmoxSourcesBackup=$File_ProxmoxSources.bak
File_ProxmoxCephSourceList=$Dir_AptAdditionalSources/ceph.list
File_ProxmoxCephSourceListBackup=$File_ProxmoxCephSourceList.bak
File_ProxmoxCephSources=$Dir_AptAdditionalSources/ceph.sources
File_ProxmoxCephSourcesBackup=$File_ProxmoxCephSources.bak
File_LinuxMintSourceList=$Dir_AptAdditionalSources/official-package-repositories.list
File_LinuxMintSourceListBackup=$File_LinuxMintSourceList.bak
File_RaspberryPiSourceList=$Dir_AptAdditionalSources/raspi.list
File_RaspberryPiSourceListBackup=$File_RaspberryPiSourceList.bak
File_PacmanMirrorList=/etc/pacman.d/mirrorlist
File_PacmanMirrorListBackup=$File_PacmanMirrorList.bak
File_PacmanEndeavourOSMirrorList=/etc/pacman.d/endeavouros-mirrorlist
File_PacmanEndeavourOSMirrorListBackup=$File_PacmanEndeavourOSMirrorList.bak
File_AlpineRepositories=/etc/apk/repositories
File_AlpineRepositoriesBackup=$File_AlpineRepositories.bak
File_GentooMakeConf=/etc/portage/make.conf
File_GentooMakeConfBackup=$File_GentooMakeConf.bak
File_GentooReposConf=/etc/portage/repos.conf/gentoo.conf
File_GentooReposConfBackup=$File_GentooReposConf.bak
File_NixConf=/etc/nix/nix.conf
File_NixConfBackup=$File_NixConf.bak

RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
PURPLE='\033[35m'
AZURE='\033[36m'
PLAIN='\033[0m'
BOLD='\033[1m'
SUCCESS="\033[1;32m✔${PLAIN}"
COMPLETE="\033[1;32m✔${PLAIN}"
WARN="\033[1;43m WARN ${PLAIN}"
ERROR="\033[1;31m✘${PLAIN}"
FAIL="\033[1;31m✘${PLAIN}"
TIP="\033[1;44m TIP ${PLAIN}"
WORKING="\033[1;36m◉${PLAIN}"

function main() {
    permission_judgment
    collect_system_info
    check_command_options
    run_start
    choose_mirrors
    choose_protocol
    choose_install_epel_packages
    backup_original_mirrors
    remove_original_mirrors
    change_mirrors_main
    upgrade_software
    run_end
}

function handle_command_options() {
    while [ $# -gt 0 ]; do
        case "$1" in
        --abroad)
            USE_ABROAD_SOURCE="true"
            ;;
        --edu)
            USE_EDU_SOURCE="true"
            ;;
        --source)
            if [ "$2" ]; then
                echo "$2" | grep -Eq "\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    command_error "$2" "$(msg "error.cmd.options.validAddress")"
                else
                    SOURCE="$(echo "$2" | sed -e 's,^http[s]\?://,,g' -e 's,/$,,')"
                    shift
                fi
            else
                command_error "$1" "$(msg "error.cmd.options.sourceAddress")"
            fi
            ;;
        --source-epel)
            if [ "$2" ]; then
                echo "$2" | grep -Eq "\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    command_error "$2" "$(msg "error.cmd.options.validAddress")"
                else
                    SOURCE_EPEL="$(echo "$2" | sed -e 's,^http[s]\?://,,g' -e 's,/$,,')"
                    shift
                fi
            else
                command_error "$1" "$(msg "error.cmd.options.sourceAddress")"
            fi
            ;;
        --source-security)
            if [ "$2" ]; then
                echo "$2" | grep -Eq "\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    command_error "$2" "$(msg "error.cmd.options.validAddress")"
                else
                    SOURCE_SECURITY="$(echo "$2" | sed -e 's,^http[s]\?://,,g' -e 's,/$,,')"
                    shift
                fi
            else
                command_error "$1" "$(msg "error.cmd.options.sourceAddress")"
            fi
            ;;
        --source-vault)
            if [ "$2" ]; then
                echo "$2" | grep -Eq "\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    command_error "$2" "$(msg "error.cmd.options.validAddress")"
                else
                    SOURCE_VAULT="$(echo "$2" | sed -e 's,^http[s]\?://,,g' -e 's,/$,,')"
                    shift
                fi
            else
                command_error "$1" "$(msg "error.cmd.options.sourceAddress")"
            fi
            ;;
        --source-portage)
            if [ "$2" ]; then
                echo "$2" | grep -Eq "\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    command_error "$2" "$(msg "error.cmd.options.validAddress")"
                else
                    SOURCE_PORTAGE="$(echo "$2" | sed -e 's,^http[s]\?://,,g' -e 's,/$,,')"
                    shift
                fi
            else
                command_error "$1" "$(msg "error.cmd.options.sourceAddress")"
            fi
            ;;
        --source-base-system)
            if [ "$2" ]; then
                echo "$2" | grep -Eq "\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    command_error "$2" "$(msg "error.cmd.options.validAddress")"
                else
                    SOURCE_BASE_SYSTEM="$(echo "$2" | sed -e 's,^http[s]\?://,,g' -e 's,/$,,')"
                    shift
                fi
            else
                command_error "$1" "$(msg "error.cmd.options.sourceAddress")"
            fi
            ;;
        --branch)
            if [ "$2" ]; then
                SOURCE_BRANCH="$2"
                shift
            else
                command_error "$1" "$(msg "error.cmd.options.sourceRepository")"
            fi
            ;;
        --branch-epel)
            if [ "$2" ]; then
                SOURCE_EPEL_BRANCH="$2"
                shift
            else
                command_error "$1" "$(msg "error.cmd.options.sourceRepository")"
            fi
            ;;
        --branch-security)
            if [ "$2" ]; then
                SOURCE_SECURITY_BRANCH="$2"
                shift
            else
                command_error "$1" "$(msg "error.cmd.options.sourceRepository")"
            fi
            ;;
        --branch-vault)
            if [ "$2" ]; then
                SOURCE_VAULT_BRANCH="$2"
                shift
            else
                command_error "$1" "$(msg "error.cmd.options.sourceRepository")"
            fi
            ;;
        --branch-portage)
            if [ "$2" ]; then
                SOURCE_PORTAGE_BRANCH="$2"
                shift
            else
                command_error "$1" "$(msg "error.cmd.options.sourceRepository")"
            fi
            ;;
        --branch-base-system)
            if [ "$2" ]; then
                SOURCE_BASE_SYSTEM_BRANCH="$2"
                shift
            else
                command_error "$1" "$(msg "error.cmd.options.sourceRepository")"
            fi
            ;;
        --codename)
            if [ "$2" ]; then
                DEBIAN_CODENAME="$2"
                shift
            else
                command_error "$1" "$(msg "error.cmd.options.codename")"
            fi
            ;;
        --use-official-source)
            if [ "$2" ]; then
                case "$2" in
                [Tt]rue | [Ff]alse)
                    USE_OFFICIAL_SOURCE="${2,,}"
                    shift
                    ;;
                *)
                    command_error "$2" "$(msg "error.cmd.options.boolean")"
                    ;;
                esac
            else
                command_error "$1" "$(msg "error.cmd.options.boolean")"
            fi
            ;;
        --use-official-source-epel)
            if [ "$2" ]; then
                case "$2" in
                [Tt]rue | [Ff]alse)
                    USE_OFFICIAL_SOURCE_EPEL="${2,,}"
                    shift
                    ;;
                *)
                    command_error "$2" "$(msg "error.cmd.options.boolean")"
                    ;;
                esac
            else
                command_error "$1" "$(msg "error.cmd.options.boolean")"
            fi
            ;;
        --intranet | --use-intranet-source)
            if [ "$2" ]; then
                case "$2" in
                [Tt]rue | [Ff]alse)
                    USE_INTRANET_SOURCE="${2,,}"
                    shift
                    ;;
                *)
                    command_error "$2" "$(msg "error.cmd.options.boolean")"
                    ;;
                esac
            else
                command_error "$1" "$(msg "error.cmd.options.boolean")"
            fi
            ;;
        --protocol | --web-protocol)
            if [ "$2" ]; then
                case "$2" in
                http | https | HTTP | HTTPS)
                    WEB_PROTOCOL="${2,,}"
                    shift
                    ;;
                *)
                    command_error "$2" "$(msg "error.cmd.options.protocol")"
                    ;;
                esac
            else
                ocommand_error "$1" "$(msg "error.cmd.options.needProtocol")"
            fi
            ;;
        --install-epel)
            if [ "$2" ]; then
                case "$2" in
                [Tt]rue | [Ff]alse)
                    INSTALL_EPEL="${2,,}"
                    shift
                    ;;
                *)
                    command_error "$2" "$(msg "error.cmd.options.boolean")"
                    ;;
                esac
            else
                command_error "$1" "$(msg "error.cmd.options.boolean")"
            fi
            ;;
        --only-epel)
            ONLY_EPEL="true"
            INSTALL_EPEL="true"
            ;;
        --backup)
            if [ "$2" ]; then
                case "$2" in
                [Tt]rue | [Ff]alse)
                    BACKUP="${2,,}"
                    shift
                    ;;
                *)
                    command_error "$2" "$(msg "error.cmd.options.boolean")"
                    ;;
                esac
            else
                command_error "$1" "$(msg "error.cmd.options.boolean")"
            fi
            ;;
        --ignore-backup-tips)
            IGNORE_BACKUP_TIPS="true"
            ;;
        --upgrade-software | --updata-software)
            if [ "$2" ]; then
                case "$2" in
                [Tt]rue | [Ff]alse)
                    UPGRADE_SOFTWARE="${2,,}"
                    shift
                    ;;
                *)
                    command_error "$2" "$(msg "error.cmd.options.boolean")"
                    ;;
                esac
            else
                command_error "$1" "$(msg "error.cmd.options.boolean")"
            fi
            ;;
        --clean-cache)
            if [ "$2" ]; then
                case "$2" in
                [Tt]rue | [Ff]alse)
                    CLEAN_CACHE="${2,,}"
                    shift
                    ;;
                *)
                    command_error "$2" "$(msg "error.cmd.options.boolean")"
                    ;;
                esac
            else
                command_error "$1" "$(msg "error.cmd.options.boolean")"
            fi
            ;;
        --lang)
            if [ "$2" ]; then
                local lang_norm="${2//_/-}"
                lang_norm="${lang_norm,,}"
                case "$lang_norm" in
                zh | zh-cn | zh-hans | zh-hans-*)
                    init_msg_pack "zh-hans"
                    shift
                    ;;
                zh-hant | zh-hant-* | zh-tw | zh-hk)
                    init_msg_pack "zh-hant"
                    shift
                    ;;
                en | en-us | en-*)
                    init_msg_pack "en"
                    shift
                    ;;
                auto)
                    choose_display_language
                    shift
                    ;;
                *)
                    command_error "$2" "$(msg "error.cmd.options.validLangKey")"
                    ;;
                esac
            else
                command_error "$1" "$(msg "error.cmd.options.langKey")"
            fi
            ;;
        --zh | --zh-[Cc][Nn])
            init_msg_pack "zh-hans"
            ;;
        --en | --en-[Uu][Ss])
            init_msg_pack "en"
            ;;
        --zh-[Hh]an[st])
            init_msg_pack "$1"
            ;;
        --clean-screen)
            if [ "$2" ]; then
                case "$2" in
                [Tt]rue | [Ff]alse)
                    CLEAN_SCREEN="${2,,}"
                    shift
                    ;;
                *)
                    command_error "$2" "$(msg "error.cmd.options.boolean")"
                    ;;
                esac
            else
                command_error "$1" "$(msg "error.cmd.options.boolean")"
            fi
            ;;
        --print-diff)
            PRINT_DIFF="true"
            ;;
        --pure-mode)
            PURE_MODE="true"
            ;;
        --help)
            echo -e "\n$(msg "commands.help" "https://github.com/SuperManito/LinuxMirrors/issues")\n"
            exit
            ;;
        *)
            command_error "$1"
            ;;
        esac
        shift
    done
    ONLY_EPEL="${ONLY_EPEL:-"false"}"
    BACKUP="${BACKUP:-"true"}"
    USE_OFFICIAL_SOURCE="${USE_OFFICIAL_SOURCE:-"false"}"
    IGNORE_BACKUP_TIPS="${IGNORE_BACKUP_TIPS:-"false"}"
    PRINT_DIFF="${PRINT_DIFF:-"false"}"
    PURE_MODE="${PURE_MODE:-"false"}"
}

function run_start() {
    if [ -z "${CLEAN_SCREEN}" ]; then
        [ -z "${SOURCE}" ] && clear
    elif [ "${CLEAN_SCREEN}" == "true" ]; then
        clear
    fi
    if [[ "${PURE_MODE}" == "true" ]]; then
        return
    fi
    local system_name="${SYSTEM_PRETTY_NAME:-"${SYSTEM_NAME} ${SYSTEM_VERSION_ID}"}"
    local arch="${DEVICE_ARCH}"
    local date_time="$(date "+%Y-%m-%d %H:%M")"
    local time_zone="$(timedatectl status 2>/dev/null | grep "Time zone" | awk -F ':' '{print$2}' | awk -F ' ' '{print$1}')"
    echo -e "+-----------------------------------+"
    echo -e "| \033[0;1;35;95m⡇\033[0m  \033[0;1;33;93m⠄\033[0m \033[0;1;32;92m⣀⡀\033[0m \033[0;1;36;96m⡀\033[0;1;34;94m⢀\033[0m \033[0;1;35;95m⡀⢀\033[0m \033[0;1;31;91m⡷\033[0;1;33;93m⢾\033[0m \033[0;1;32;92m⠄\033[0m \033[0;1;36;96m⡀⣀\033[0m \033[0;1;34;94m⡀\033[0;1;35;95m⣀\033[0m \033[0;1;31;91m⢀⡀\033[0m \033[0;1;33;93m⡀\033[0;1;32;92m⣀\033[0m \033[0;1;36;96m⢀⣀\033[0m |"
    echo -e "| \033[0;1;31;91m⠧\033[0;1;33;93m⠤\033[0m \033[0;1;32;92m⠇\033[0m \033[0;1;36;96m⠇⠸\033[0m \033[0;1;34;94m⠣\033[0;1;35;95m⠼\033[0m \033[0;1;31;91m⠜⠣\033[0m \033[0;1;33;93m⠇\033[0;1;32;92m⠸\033[0m \033[0;1;36;96m⠇\033[0m \033[0;1;34;94m⠏\033[0m  \033[0;1;35;95m⠏\033[0m  \033[0;1;33;93m⠣⠜\033[0m \033[0;1;32;92m⠏\033[0m  \033[0;1;34;94m⠭⠕\033[0m |"
    echo -e "+-----------------------------------+"
    echo -e "$(msg "start.welcome")"
    echo -e ''
    echo -e "$(msg "start.runtimeEnv") ${BLUE}${system_name} ${arch}${PLAIN}"
    echo -e "$(msg "start.dateTime") ${BLUE}${date_time} ${time_zone}${PLAIN}"
    sleep 1 >/dev/null 2>&1
}

function run_end() {
    if [[ "${PURE_MODE}" == "true" ]]; then
        echo ''
        return
    fi
    echo -e "\n✨ $(msg "end.moreInfo") 👉 \033[3mhttps://linuxmirrors.cn\033[0m"
    echo -e "\n\033[3;1mPowered by \033[34mLinuxMirrors\033[0m\n"
}

function output_error() {
    [ "$1" ] && echo -e "\n$ERROR $1\n"
    exit 1
}

function command_error() {
    local tmp_text="$(msg "error.cmd.options.needConfirm")"
    if [[ "${2}" ]]; then
        tmp_text="$(msg "error.cmd.options.needSpecify" "${2}")"
    fi
    output_error "$(msg "error.cmd.options.invalid" "${BLUE}$1${PLAIN}" "${tmp_text}")"
}

function unsupport_system_error() {
    output_error "$(msg "error.unsupportSystem" "${1}")"
}

function input_error() {
    echo -e "\n$WARN $(msg "error.input" "${1}")"
}

function command_exists() {
    command -v "$@" &>/dev/null
}

function permission_judgment() {
    if [ $UID -ne 0 ]; then
        local change_cmd="su root"
        if command_exists sudo; then
            change_cmd="sudo -i"
        fi
        output_error "$(msg "error.needRoot" "${BLUE}${change_cmd}${PLAIN}")"
    fi
}

function get_os_release_value() {
    grep -E "^${1}=" $File_LinuxRelease | cut -d= -f2- | sed "s/[\'\"]//g"
}

function collect_system_info() {
    if [ ! -s "${File_LinuxRelease}" ]; then
        unsupport_system_error "$(msg "error.unknownSystem")"
    fi
    SYSTEM_NAME="$(get_os_release_value NAME)"
    SYSTEM_PRETTY_NAME="$(get_os_release_value PRETTY_NAME)"
    SYSTEM_VERSION_ID="$(get_os_release_value VERSION_ID)"
    SYSTEM_VERSION_ID_MAJOR="${SYSTEM_VERSION_ID%%.*}"
    SYSTEM_VERSION_ID_MINOR="${SYSTEM_VERSION_ID#*.}"
    SYSTEM_ID="$(get_os_release_value ID)"
    if [ -s "${File_DebianVersion}" ]; then
        SYSTEM_FACTIONS="${SYSTEM_DEBIAN}"
    elif [ -s "${File_RedHatRelease}" ]; then
        SYSTEM_FACTIONS="${SYSTEM_REDHAT}"
    elif [ -s "${File_openEulerRelease}" ]; then
        SYSTEM_FACTIONS="${SYSTEM_OPENEULER}"
    elif [ -s "${File_OpenCloudOSRelease}" ]; then
        SYSTEM_FACTIONS="${SYSTEM_OPENCLOUDOS}"
    elif [ -s "${File_AnolisOSRelease}" ]; then
        SYSTEM_FACTIONS="${SYSTEM_ANOLISOS}"
    elif [ -s "${File_kylinVersion}" ] && [[ "${SYSTEM_ID}" == *"openkylin"* ]]; then
        SYSTEM_FACTIONS="${SYSTEM_OPENKYLIN}"
    elif [ -f "${File_ArchLinuxRelease}" ]; then
        SYSTEM_FACTIONS="${SYSTEM_ARCH}"
    elif [ -f "${File_AlpineRelease}" ]; then
        SYSTEM_FACTIONS="${SYSTEM_ALPINE}"
    elif [ -f "${File_GentooRelease}" ]; then
        SYSTEM_FACTIONS="${SYSTEM_GENTOO}"
    elif [[ "${SYSTEM_NAME}" == *"openSUSE"* ]]; then
        SYSTEM_FACTIONS="${SYSTEM_OPENSUSE}"
    elif [[ "${SYSTEM_NAME}" == *"NixOS"* ]]; then
        SYSTEM_FACTIONS="${SYSTEM_NIXOS}"
    elif [[ "${SYSTEM_ID}" == "void" ]]; then
        SYSTEM_FACTIONS="${SYSTEM_VOID}"
    else
        unsupport_system_error "$(msg "error.unknownSystem")"
    fi
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
        if command_exists lsb_release; then
            SYSTEM_JUDGMENT="$(lsb_release -is)"
            SYSTEM_VERSION_CODENAME="${DEBIAN_CODENAME:-"$(lsb_release -cs)"}"
        else
            SYSTEM_JUDGMENT="${SYSTEM_ID^}"
            if [ "${SYSTEM_NAME}" ]; then
                if [[ "${SYSTEM_ID,,}" == "${SYSTEM_NAME,,}" ]]; then
                    SYSTEM_JUDGMENT="${SYSTEM_NAME}"
                fi
            fi
            SYSTEM_VERSION_CODENAME="${DEBIAN_CODENAME:-"$(get_os_release_value VERSION_CODENAME)"}"
        fi
        if [[ "${SYSTEM_FACTIONS}" == "${SYSTEM_DEBIAN}" ]] && [ -s "${File_RaspberryPiOSRelease}" ]; then
            SYSTEM_JUDGMENT="${SYSTEM_RASPBERRY_PI_OS}"
            SYSTEM_PRETTY_NAME="${SYSTEM_RASPBERRY_PI_OS}"
        fi
        if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_DEBIAN}" ]]; then
            if [[ -z "${SYSTEM_VERSION_ID}" && "${SYSTEM_VERSION_CODENAME}" == "forky" ]]; then
                SYSTEM_VERSION_ID="14"
                SYSTEM_VERSION_ID_MAJOR="${SYSTEM_VERSION_ID%%.*}"
                SYSTEM_VERSION_ID_MINOR="${SYSTEM_VERSION_ID#*.}"
            fi
            if [[ "${SYSTEM_VERSION_ID_MAJOR}" && "${SYSTEM_VERSION_ID_MAJOR}" -ge 13 ]]; then
                USE_DEB822_FORMAT="true"
            fi
        fi
        if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_UBUNTU}" ]]; then
            if [[ "${SYSTEM_VERSION_ID_MAJOR}" && "${SYSTEM_VERSION_ID_MAJOR}" -ge 24 ]]; then
                USE_DEB822_FORMAT="true"
            fi
        fi
        ;;
    "${SYSTEM_REDHAT}")
        SYSTEM_JUDGMENT="$(awk '{printf $1}' $File_RedHatRelease)"
        grep -q "${SYSTEM_RHEL}" $File_RedHatRelease && SYSTEM_JUDGMENT="${SYSTEM_RHEL}"
        grep -q "${SYSTEM_CENTOS_STREAM}" $File_RedHatRelease && SYSTEM_JUDGMENT="${SYSTEM_CENTOS_STREAM}"
        [ -s "${File_OracleLinuxRelease}" ] && SYSTEM_JUDGMENT="${SYSTEM_ORACLE}"
        ;;
    "${SYSTEM_ARCH}")
        if [ -f "${File_ManjaroRelease}" ]; then
            SYSTEM_JUDGMENT="${SYSTEM_MANJARO}"
        else
            SYSTEM_JUDGMENT="${SYSTEM_FACTIONS}"
        fi
        ;;
    *)
        SYSTEM_JUDGMENT="${SYSTEM_FACTIONS}"
        ;;
    esac
    local is_supported="true"
    case "${SYSTEM_JUDGMENT}" in
    "${SYSTEM_DEBIAN}")
        if [[ ! "${SYSTEM_VERSION_ID_MAJOR}" =~ ^(1[0-3]|[8-9])$ ]]; then
            is_supported="false"
        fi
        if [[ "${SYSTEM_VERSION_CODENAME}" == "sid" ]]; then
            if [[ "${PURE_MODE}" != "true" ]]; then
                echo -e "\n${WARN} $(msg "warn.unstableDebian" "${BLUE}unstable(sid)${PLAIN}")\n"
            fi
        fi
        ;;
    "${SYSTEM_UBUNTU}")
        if [[ ! "${SYSTEM_VERSION_ID_MAJOR}" =~ ^(1[4-9]|2[0-6])$ ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_LINUX_MINT}")
        if [[ "${SYSTEM_NAME}" == *"LMDE"* ]]; then
            if [[ "${SYSTEM_VERSION_ID_MAJOR}" != [6-7] ]]; then
                is_supported="false"
            fi
        else
            if [[ ! "${SYSTEM_VERSION_ID_MAJOR}" =~ ^(19|2[0-2])$ ]]; then
                is_supported="false"
            fi
        fi
        ;;
    "${SYSTEM_RHEL}")
        if [[ ! "${SYSTEM_VERSION_ID_MAJOR}" =~ ^([7-9]|10)$ ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_CENTOS}")
        if [[ "${SYSTEM_VERSION_ID_MAJOR}" != [7-8] ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_CENTOS_STREAM}" | "${SYSTEM_ROCKY}" | "${SYSTEM_ALMALINUX}" | "${SYSTEM_ORACLE}")
        if [[ ! "${SYSTEM_VERSION_ID_MAJOR}" =~ ^([8-9]|10)$ ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_FEDORA}")
        if [[ "${SYSTEM_VERSION_ID}" != [3-4][0-9] ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_OPENEULER}")
        if [[ "${SYSTEM_VERSION_ID_MAJOR}" != 2[0-5] ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_OPENCLOUDOS}")
        if [[ ! "${SYSTEM_VERSION_ID_MAJOR}" =~ ^([8-9]|23)$ ]] || [[ "${SYSTEM_VERSION_ID_MAJOR}" == 8 && "${SYSTEM_VERSION_ID_MINOR}" -lt 6 ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_ANOLISOS}")
        if [[ ! "${SYSTEM_VERSION_ID_MAJOR}" =~ ^(8|23)$ ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_OPENSUSE}")
        case "${SYSTEM_ID}" in
        "opensuse-leap")
            if [[ "${SYSTEM_VERSION_ID_MAJOR}" != 1[5-6] ]]; then
                is_supported="false"
            fi
            ;;
        "opensuse-tumbleweed") ;;
        *)
            is_supported="false"
            ;;
        esac
        ;;
    "${SYSTEM_KALI}" | "${SYSTEM_DEEPIN}" | "${SYSTEM_ZORIN}" | "${SYSTEM_RASPBERRY_PI_OS}" | "${SYSTEM_OPENKYLIN}") ;;
    "${SYSTEM_ARCH}" | "${SYSTEM_MANJARO}" | "${SYSTEM_ALPINE}" | "${SYSTEM_GENTOO}" | "${SYSTEM_NIXOS}" | "${SYSTEM_VOID}") ;;
    *)
        unsupport_system_error "$(msg "error.unknownVersion")"
        ;;
    esac
    if [[ "${is_supported}" == "false" ]]; then
        unsupport_system_error "$(msg "error.unsupportVersion")"
    fi
    DEVICE_ARCH_RAW="$(uname -m)"
    case "${DEVICE_ARCH_RAW}" in
    x86_64)
        DEVICE_ARCH="x86_64"
        ;;
    aarch64)
        DEVICE_ARCH="ARM64"
        ;;
    armv8l)
        DEVICE_ARCH="ARMv8_32"
        ;;
    armv7l)
        DEVICE_ARCH="ARMv7"
        ;;
    armv6l)
        DEVICE_ARCH="ARMv6"
        ;;
    armv5tel)
        DEVICE_ARCH="ARMv5"
        ;;
    i686)
        DEVICE_ARCH="x86_32"
        ;;
    *)
        DEVICE_ARCH="${DEVICE_ARCH_RAW}"
        ;;
    esac
    if [[ -z "${SOURCE_BRANCH}" ]]; then
        SOURCE_BRANCH="${SYSTEM_JUDGMENT,,}"
        SOURCE_BRANCH="${SOURCE_BRANCH// /-}"
        case "${SYSTEM_JUDGMENT}" in
        "${SYSTEM_DEBIAN}")
            case "${SYSTEM_VERSION_ID_MAJOR}" in
            8 | 9 | 10 | 11)
                SOURCE_BRANCH="debian-archive/debian"
                ;;
            *)
                SOURCE_BRANCH="debian"
                ;;
            esac
            ;;
        "${SYSTEM_UBUNTU}" | "${SYSTEM_ZORIN}")
            if [[ "${DEVICE_ARCH_RAW}" == "x86_64" || "${DEVICE_ARCH_RAW}" == *i?86* ]]; then
                SOURCE_BRANCH="ubuntu"
            else
                SOURCE_BRANCH="ubuntu-ports"
            fi
            ;;
        "${SYSTEM_RASPBERRY_PI_OS}")
            SOURCE_BRANCH="raspberrypi"
            ;;
        "${SYSTEM_RHEL}")
            case "${SYSTEM_VERSION_ID_MAJOR}" in
            7 | 8)
                if [[ "${DEVICE_ARCH_RAW}" == "x86_64" ]]; then
                    SOURCE_BRANCH="centos-vault"
                else
                    SOURCE_BRANCH="centos-altarch"
                fi
                ;;
            *)
                SOURCE_BRANCH="centos-stream"
                ;;
            esac
            ;;
        "${SYSTEM_CENTOS}")
            if [[ "${DEVICE_ARCH_RAW}" == "x86_64" ]]; then
                SOURCE_BRANCH="centos-vault"
            else
                SOURCE_BRANCH="centos-altarch"
            fi
            ;;
        "${SYSTEM_CENTOS_STREAM}" | "${SYSTEM_ORACLE}")
            case "${SYSTEM_VERSION_ID_MAJOR}" in
            8)
                if [[ "${DEVICE_ARCH_RAW}" == "x86_64" ]]; then
                    SOURCE_BRANCH="centos-vault"
                else
                    SOURCE_BRANCH="centos-altarch"
                fi
                ;;
            *)
                SOURCE_BRANCH="centos-stream"
                ;;
            esac
            ;;
        "${SYSTEM_FEDORA}")
            if [[ "${SYSTEM_VERSION_ID}" -lt 39 ]]; then
                SOURCE_BRANCH="fedora-archive"
            fi
            ;;
        "${SYSTEM_ARCH}")
            if [[ "${DEVICE_ARCH_RAW}" == "x86_64" || "${DEVICE_ARCH_RAW}" == *i?86* ]]; then
                SOURCE_BRANCH="archlinux"
            else
                SOURCE_BRANCH="archlinuxarm"
            fi
            if [[ "${SYSTEM_NAME}" == *"EndeavourOS"* ]] && [[ -f "${File_PacmanEndeavourOSMirrorList}" ]]; then
                SOURCE_BRANCH="archlinux"
            fi
            ;;
        "${SYSTEM_OPENCLOUDOS}")
            grep -q "${SYSTEM_OPENCLOUDOS_STREAM}" $File_OpenCloudOSRelease
            if [ $? -eq 0 ]; then
                SOURCE_BRANCH="${SYSTEM_OPENCLOUDOS_STREAM,,}"
                SOURCE_BRANCH="${SOURCE_BRANCH// /-}"
            fi
            ;;
        "${SYSTEM_NIXOS}")
            SOURCE_BRANCH="nix-channels"
            ;;
        "${SYSTEM_VOID}")
            SOURCE_BRANCH="voidlinux"
            ;;
        esac
    fi
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}" | "${SYSTEM_ALPINE}" | "${SYSTEM_OPENKYLIN}")
        SYNC_MIRROR_TEXT="$(msg "source.sync.text1")"
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}")
        SYNC_MIRROR_TEXT="$(msg "source.sync.text2")"
        ;;
    "${SYSTEM_OPENSUSE}")
        SYNC_MIRROR_TEXT="$(msg "source.sync.text3")"
        ;;
    "${SYSTEM_ARCH}" | "${SYSTEM_GENTOO}" | "${SYSTEM_VOID}")
        SYNC_MIRROR_TEXT="$(msg "source.sync.text4")"
        ;;
    "${SYSTEM_NIXOS}")
        SYNC_MIRROR_TEXT="$(msg "source.sync.text5")"
        ;;
    esac
    CAN_USE_ADVANCED_INTERACTIVE_SELECTION="false"
    if command_exists tput; then
        CAN_USE_ADVANCED_INTERACTIVE_SELECTION="true"
    fi
}

function check_command_options() {
    if [[ "${USE_ABROAD_SOURCE}" == "true" && "${USE_EDU_SOURCE}" == "true" ]]; then
        output_error "$(msg "error.cmd.options.unsupportTwoSourceMode")"
    fi
    if [[ "${DEBIAN_CODENAME}" ]]; then
        if [[ "${SYSTEM_FACTIONS}" != "${SYSTEM_DEBIAN}" && "${SYSTEM_FACTIONS}" != "${SYSTEM_OPENKYLIN}" ]]; then
            output_error "$(msg "error.cmd.options.unsupportCodename")"
        fi
    fi
    if [[ "${ONLY_EPEL}" == "true" ]]; then
        case "${SYSTEM_FACTIONS}" in
        "${SYSTEM_REDHAT}")
            if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_FEDORA}" ]]; then
                output_error "$(msg "error.cmd.options.unsupportEPEL")"
            fi
            ;;
        *)
            output_error "$(msg "error.cmd.options.unsupportEPEL")"
            ;;
        esac
    fi
}

function choose_display_language() {
    local result
    if command_exists tput; then
        local -a lang_key_labels=()
        local language_text
        for ((i = 0; i < ${#MESSAGE_LANG_KEYS[@]}; i++)); do
            language_text="${MESSAGE_LANG_DISPLAY[${MESSAGE_LANG_KEYS[$i]}]}"
            if [[ "${language_text}" ]]; then
                lang_key_labels+=("${language_text}")
            else
                lang_key_labels+=("")
            fi
        done
        interactive_select_list "MESSAGE_LANG_KEYS" "\n ${BOLD}Please select the display language:${PLAIN}\n" "lang_key_labels"
        result="${_SELECT_RESULT%%@@*}"
    else
        echo ''
        for ((i = 0; i < ${#MESSAGE_LANG_KEYS[@]}; i++)); do
            echo -e " $((i + 1)). ${MESSAGE_LANG_DISPLAY[${MESSAGE_LANG_KEYS[$i]}]}"
        done
        local CHOICE="$(echo -e "\n${BOLD}└─ Please select and enter the display language [ 1-${#MESSAGE_LANG_KEYS[@]} ]：${PLAIN}")"
        while true; do
            read -rp "${CHOICE}" INPUT
            case "${INPUT}" in
            [1-9] | [1-9][0-9])
                local tmp_result="${MESSAGE_LANG_KEYS[$((INPUT - 1))]}"
                if [[ -z "${tmp_result}" ]]; then
                    echo -e "\n$WARN $(msg "warn.needValidNumberIndex")"
                else
                    result="${tmp_result}"
                    break
                fi
                ;;
            *)
                echo -e "\n$WARN $(msg "warn.needInputNumberIndex")"
                ;;
            esac
        done
    fi
    init_msg_pack "${result}"
}

function choose_mirrors() {
    function print_mirrors_list() {
        local tmp_name tmp_index i j
        function StringLength() {
            local text=$1
            echo "${#text}"
        }
        local -a list_arr=()
        local list_arr_sum="$(eval echo \${#$1[@]})"
        for ((i = 0; i < $list_arr_sum; i++)); do
            list_arr[$i]="$(eval echo \${$1[i]})"
        done
        local name_width=${2:-"30"}
        local -a list_labels=()
        if [[ "${3}" ]]; then
            eval "list_labels=(\"\${${3}[@]}\")"
        fi
        if command_exists printf; then
            local tmp_uchar_1 tmp_uchar_2 tmp_uchar_3 tmp_uchar_4 tmp_default_length tmp_length tmp_unicode_length tmp_spaces_nums tmp_max_length
            for ((i = 0; i < ${#list_arr[@]}; i++)); do
                if [[ "${list_labels[$i]}" ]]; then
                    tmp_name="${list_labels[$i]}"
                else
                    tmp_name="${list_arr[i]}"
                fi
                tmp_index=$((i + 1))
                tmp_default_length="${name_width}"
                tmp_uchar_1=$(echo "${tmp_name}" | grep -c "“")
                tmp_uchar_2=$(echo "${tmp_name}" | grep -c "”")
                tmp_uchar_3=$(echo "${tmp_name}" | grep -c "‘")
                tmp_uchar_4=$(echo "${tmp_name}" | grep -c "’")
                [[ "${tmp_uchar_1}" -gt 0 ]] && ((tmp_default_length += tmp_uchar_1))
                [[ "${tmp_uchar_2}" -gt 0 ]] && ((tmp_default_length += tmp_uchar_2))
                [[ "${tmp_uchar_3}" -gt 0 ]] && ((tmp_default_length += tmp_uchar_3))
                [[ "${tmp_uchar_4}" -gt 0 ]] && ((tmp_default_length += tmp_uchar_4))
                tmp_length=$(StringLength "${tmp_name}")
                tmp_unicode_length=$(StringLength "$(echo "${tmp_name}" | sed "s|[0-9a-zA-Z -~]||g; s| ||g")")
                tmp_max_length=$((tmp_default_length + tmp_unicode_length))
                tmp_spaces_nums=$((((tmp_default_length - tmp_unicode_length - tmp_length)) / 2))
                if [[ $tmp_spaces_nums -gt 0 ]]; then
                    tmp_name="${tmp_name}$(printf '%*s' ${tmp_spaces_nums} '')"
                fi
                printf "❖  %-${tmp_max_length}s %4s\n" "${tmp_name}" "${tmp_index})"
            done
        else
            for ((i = 0; i < ${#list_arr[@]}; i++)); do
                if [[ "${list_labels[$i]}" ]]; then
                    tmp_name="${list_labels[$i]}"
                else
                    tmp_name="${list_arr[i]}"
                fi
                tmp_index=$((i + 1))
                echo -e " ❖  $tmp_index. ${tmp_name}"
            done
        fi
    }

    function choose_use_intranet_address() {
        local intranet_source
        for ((i = 0; i < ${#mirror_list_extranet[@]}; i++)); do
            if [[ "${SOURCE}" == "${mirror_list_extranet[i]}" ]]; then
                intranet_source="${mirror_list_intranet[i]}"
                break
            else
                continue
            fi
        done
        if [[ -z "${USE_INTRANET_SOURCE}" ]]; then
            if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
                echo ''
                interactive_select_boolean "${BOLD}$(msg "interaction.source.type.select")${PLAIN}" "$(msg "interaction.source.type.public")" "$(msg "interaction.source.type.intranet")"
                if [[ "${_SELECT_RESULT}" == "false" ]]; then
                    SOURCE="${intranet_source}"
                    ONLY_HTTP="true"
                    [[ "${PURE_MODE}" != "true" ]] && echo -e "\n$WARN $(msg "warn.usedIntranetSource")"
                fi
            else
                local CHOICE="$(echo -e "\n${BOLD}└─ $(msg "interaction.source.type.usePublicAddress")? [Y/n] ${PLAIN}")"
                read -rp "${CHOICE}" INPUT
                [[ -z "${INPUT}" ]] && INPUT=Y
                case "${INPUT}" in
                [Yy] | [Yy][Ee][Ss]) ;;
                [Nn] | [Nn][Oo])
                    SOURCE="${intranet_source}"
                    ONLY_HTTP="true"
                    [[ "${PURE_MODE}" != "true" ]] && echo -e "\n$WARN $(msg "warn.usedIntranetSource")"
                    ;;
                *)
                    input_error "$(msg "error.defaultBehavior.noUseIntranetSource")"
                    ;;
                esac
            fi
        elif [[ "${USE_INTRANET_SOURCE}" == "true" ]]; then
            SOURCE="${intranet_source}"
        fi
    }

    if [[ -z "${SOURCE}" ]]; then
        if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
            return
        fi

        local mirror_list_name mirror_list_label_msg_prefix mirror_list_print_length
        if [[ "${USE_ABROAD_SOURCE}" = "true" ]]; then
            mirror_list_name="mirror_list_abroad"
            mirror_list_label_msg_prefix="mirrors.abroad"
            mirror_list_print_length=56
        elif [[ "${USE_EDU_SOURCE}" = "true" ]]; then
            mirror_list_name="mirror_list_edu"
            mirror_list_label_msg_prefix="mirrors.edu"
            mirror_list_print_length=32
        else
            mirror_list_name="mirror_list_default"
            mirror_list_label_msg_prefix="mirrors.default"
            mirror_list_print_length=32
        fi
        local -a mirror_list_labels=()
        local mirror_list_length=$(eval "echo \${#${mirror_list_name}[@]}")
        local label_msg_index label_msg_content
        for ((i = 0; i < ${mirror_list_length}; i++)); do
            label_msg_index="${mirror_list_label_msg_prefix}.${i}"
            label_msg_content="$(msg "${label_msg_index}")"
            if [[ "${label_msg_content}" == "${label_msg_index}" ]]; then
                mirror_list_labels+=("")
            else
                mirror_list_labels+=("${label_msg_content}")
            fi
        done

        if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
            interactive_select_list "${mirror_list_name}" "\n ${BOLD}$(msg "interaction.source.select")${PLAIN}\n" "mirror_list_labels"
            SOURCE="${_SELECT_RESULT%%@@*}"
            echo -e "\n${GREEN}➜${PLAIN}  ${BOLD}${_SELECT_RESULT#*@@}${PLAIN}" | sed "s| · |-|g"
        else
            echo ''
            print_mirrors_list "${mirror_list_name}" "${mirror_list_print_length}" "mirror_list_labels"
            local CHOICE="$(echo -e "\n${BOLD}└─ $(msg "interaction.source.selectAndInput") [ 1-$(eval echo \${#${mirror_list_name}[@]}) ]：${PLAIN}")"
            while true; do
                read -rp "${CHOICE}" INPUT
                case "${INPUT}" in
                [1-9] | [1-9][0-9] | [1-9][0-9][0-9])
                    local tmp_result="$(eval echo \${${mirror_list_name}[$((INPUT - 1))]})"
                    if [[ -z "${tmp_result}" ]]; then
                        echo -e "\n$WARN $(msg "warn.needValidNumberIndex")"
                    else
                        SOURCE="${tmp_result}"
                        break
                    fi
                    ;;
                *)
                    echo -e "\n$WARN $(msg "warn.needInputNumberIndex")"
                    ;;
                esac
            done
        fi

        if [[ "${SOURCE}" == "__OFFICIAL_SOURCE_TAG__" ]]; then
            USE_OFFICIAL_SOURCE="true"
            SOURCE=""
            return
        fi
    fi

    if [[ "${mirror_list_extranet[*]}" =~ (^|[^[:alpha:]])"${SOURCE}"([^[:alpha:]]|$) ]]; then
        choose_use_intranet_address
    fi
}

function choose_protocol() {
    if [[ -z "${WEB_PROTOCOL}" ]]; then
        if [[ "${ONLY_HTTP}" == "true" ]]; then
            WEB_PROTOCOL="http"
        else
            if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
                echo ''
                interactive_select_boolean "${BOLD}$(msg "interaction.protocol.select")${PLAIN}" "HTTP" "HTTPS"
                if [[ "${_SELECT_RESULT}" == "true" ]]; then
                    WEB_PROTOCOL="http"
                else
                    WEB_PROTOCOL="https"
                fi
            else
                local CHOICE="$(echo -e "\n${BOLD}└─ $(msg "interaction.protocol.useHttp")? [Y/n] ${PLAIN}")"
                read -rp "${CHOICE}" INPUT
                [[ -z "${INPUT}" ]] && INPUT=Y
                case "${INPUT}" in
                [Yy] | [Yy][Ee][Ss])
                    WEB_PROTOCOL="http"
                    ;;
                [Nn] | [Nn][Oo])
                    WEB_PROTOCOL="https"
                    ;;
                *)
                    input_error "$(msg "error.defaultBehavior.https")"
                    WEB_PROTOCOL="https"
                    ;;
                esac
            fi
        fi
    fi
    WEB_PROTOCOL="${WEB_PROTOCOL,,}"
}

function choose_install_epel_packages() {
    function check_install_status() {
        rpm -qa | grep epel-release -q
        VERIFICATION_EPEL=$?
    }

    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_REDHAT}")
        if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_FEDORA}" ]] || [[ "${INSTALL_EPEL}" == "false" ]]; then
            INSTALL_EPEL="false"
            return
        else
            check_install_status
        fi
        ;;
    *)
        INSTALL_EPEL="false"
        return
        ;;
    esac
    if [[ -z "${INSTALL_EPEL}" ]]; then
        local ask_text
        if [ $VERIFICATION_EPEL -eq 0 ]; then
            ask_text="$(msg "interaction.epel.skipReplace")"
        else
            ask_text="$(msg "interaction.epel.install")"
        fi
        if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
            echo ''
            interactive_select_boolean "${BOLD}${ask_text}?${PLAIN}"
            if [[ "${_SELECT_RESULT}" == "true" ]]; then
                INSTALL_EPEL="true"
            else
                INSTALL_EPEL="false"
            fi
        else
            local CHOICE="$(echo -e "\n${BOLD}└─ ${ask_text}? [Y/n] ${PLAIN}")"
            read -rp "${CHOICE}" INPUT
            [[ -z "${INPUT}" ]] && INPUT=Y
            case "${INPUT}" in
            [Yy] | [Yy][Ee][Ss])
                INSTALL_EPEL="true"
                ;;
            [Nn] | [Nn][Oo])
                INSTALL_EPEL="false"
                ;;
            *)
                input_error "$(msg "error.defaultBehavior.noReplace")"
                INSTALL_EPEL="false"
                ;;
            esac
        fi
    fi
}

function backup_original_mirrors() {
    function backup_file() {
        local target_file=$1
        local backup_file=$2
        local type="$3"
        [ -f "${target_file}" ] || touch "${target_file}"
        if [ ! -s "${target_file}" ]; then
            return
        fi
        if [ -s "${backup_file}" ]; then
            if [[ "${IGNORE_BACKUP_TIPS}" != "false" ]]; then
                return
            fi
            local ask_text="$(msg "interaction.backup.skipOverwrite.sourceFile" "${type}")?"
            if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
                echo ''
                interactive_select_boolean "${BOLD}${ask_text}${PLAIN}"
                if [[ "${_SELECT_RESULT}" == "false" ]]; then
                    echo ''
                    cp -rvf "${target_file}" "${backup_file}" 2>&1
                    BACKED_UP="true"
                fi
            else
                local CHOICE_BACKUP="$(echo -e "\n${BOLD}└─ ${ask_text} [Y/n] ${PLAIN}")"
                read -rp "${CHOICE_BACKUP}" INPUT
                [[ -z "${INPUT}" ]] && INPUT=Y
                case "${INPUT}" in
                [Yy] | [Yy][Ee][Ss]) ;;
                [Nn] | [Nn][Oo])
                    echo ''
                    cp -rvf "${target_file}" "${backup_file}" 2>&1
                    BACKED_UP="true"
                    ;;
                *)
                    input_error "$(msg "error.defaultBehavior.noOverwrite")"
                    ;;
                esac
            fi
        else
            echo ''
            cp -rvf "${target_file}" "${backup_file}" 2>&1
            BACKED_UP="true"
            echo -e "\n$COMPLETE $(msg "info.backuped.sourceFile" "${type}")"
            sleep 1s
        fi
    }
    function backup_dir() {
        local target_dir=$1
        local backup_dir=$2
        local file_type="${3:-repo}"
        [ -d "${target_dir}" ] || mkdir -p "${target_dir}"
        [ -d "${backup_dir}" ] || mkdir -p "${backup_dir}"
        ls "${target_dir}" | grep "\.${file_type}$" -q
        if [ $? -ne 0 ]; then
            return
        fi
        ls "${backup_dir}" | grep "\.${file_type}$" -q
        if [ $? -eq 0 ]; then
            if [[ "${IGNORE_BACKUP_TIPS}" != "false" ]]; then
                return
            fi
            local ask_text="$(msg "interaction.backup.skipOverwrite.sourceFile" "${file_type}")?"
            if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
                echo ''
                interactive_select_boolean "${BOLD}${ask_text}${PLAIN}"
                if [[ "${_SELECT_RESULT}" == "false" ]]; then
                    echo ''
                    cp -rvf $target_dir/* "${backup_dir}" 2>&1
                    BACKED_UP="true"
                fi
            else
                local CHOICE_BACKUP="$(echo -e "\n${BOLD}└─ ${ask_text} [Y/n] ${PLAIN}")"
                read -rp "${CHOICE_BACKUP}" INPUT
                [[ -z "${INPUT}" ]] && INPUT=Y
                case "${INPUT}" in
                [Yy] | [Yy][Ee][Ss]) ;;
                [Nn] | [Nn][Oo])
                    echo ''
                    cp -rvf $target_dir/* "${backup_dir}" 2>&1
                    BACKED_UP="true"
                    ;;
                *)
                    input_error "$(msg "error.defaultBehavior.noOverwrite")"
                    ;;
                esac
            fi
        else
            echo ''
            cp -rvf $target_dir/* "${backup_dir}" 2>&1
            BACKED_UP="true"
            echo -e "\n$COMPLETE $(msg "info.backuped.sourceFile" "${file_type}")"
            sleep 1s
        fi
    }

    BACKED_UP="false"
    if [[ "${BACKUP}" == "true" ]]; then
        case "${SYSTEM_FACTIONS}" in
        "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
            if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_DEBIAN}" ]] && [ -f "${File_DebianSources}" ]; then
                backup_file $File_DebianSources $File_DebianSourcesBackup "debian.sources"
                USE_DEB822_FORMAT="true"
            fi
            if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_UBUNTU}" ]] && [ -f "${File_UbuntuSources}" ]; then
                backup_file $File_UbuntuSources $File_UbuntuSourcesBackup "ubuntu.sources"
                USE_DEB822_FORMAT="true"
            fi
            if [[ "${SYSTEM_JUDGMENT}" != "${SYSTEM_LINUX_MINT}" && -s "${File_AptSourceList}" ]]; then
                if [[ "${USE_DEB822_FORMAT}" == "true" ]]; then
                    grep -Eqv '^#|^$' $File_AptSourceList
                    if [ $? -eq 0 ]; then
                        backup_file $File_AptSourceList $File_AptSourceListBackup "sources.list"
                    fi
                else
                    backup_file $File_AptSourceList $File_AptSourceListBackup "sources.list"
                fi
            fi
            if [ -f "${File_ArmbianRelease}" ]; then
                backup_file $File_ArmbianSourceList $File_ArmbianSourceListBackup "armbian.list"
            fi
            if [ -f "${File_ProxmoxVersion}" ]; then
                if [[ "${USE_DEB822_FORMAT}" == "true" ]]; then
                    backup_file $File_ProxmoxSources $File_ProxmoxSourcesBackup "pve-no-subscription.sources"
                    [ -f "${File_ProxmoxCephSources}" ] && backup_file $File_ProxmoxCephSources $File_ProxmoxCephSourcesBackup "ceph.sources"
                else
                    backup_file $File_ProxmoxSourceList $File_ProxmoxSourceListBackup "pve-no-subscription.list"
                    [ -f "${File_ProxmoxCephSourceList}" ] && backup_file $File_ProxmoxCephSourceList $File_ProxmoxCephSourceListBackup "ceph.list"
                fi
            fi
            if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_LINUX_MINT}" ]]; then
                backup_file $File_LinuxMintSourceList $File_LinuxMintSourceListBackup "official-package-repositories.list"
            fi
            if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_RASPBERRY_PI_OS}" ]]; then
                backup_file $File_RaspberryPiSourceList $File_RaspberryPiSourceListBackup "raspi.list"
            fi
            ;;
        "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}")
            backup_dir $Dir_YumRepos $Dir_YumReposBackup
            ;;
        "${SYSTEM_OPENSUSE}")
            backup_dir $Dir_ZYppRepos $Dir_ZYppReposBackup
            ;;
        "${SYSTEM_ARCH}")
            backup_file $File_PacmanMirrorList $File_PacmanMirrorListBackup "mirrorlist"
            if [[ "${SYSTEM_NAME}" == *"EndeavourOS"* ]] && [[ -f "${File_PacmanEndeavourOSMirrorList}" ]]; then
                backup_file $File_PacmanEndeavourOSMirrorList $File_PacmanEndeavourOSMirrorListBackup "endeavouros-mirrorlist"
            fi
            ;;
        "${SYSTEM_ALPINE}")
            backup_file $File_AlpineRepositories $File_AlpineRepositoriesBackup "repositories"
            ;;
        "${SYSTEM_GENTOO}")
            backup_file $File_GentooMakeConf $File_GentooMakeConfBackup "make.conf"
            [ -d "${Dir_GentooReposConf}" ] || mkdir -p "${Dir_GentooReposConf}"
            backup_file $File_GentooReposConf $File_GentooReposConfBackup "gentoo.conf"
            ;;
        "${SYSTEM_NIXOS}")
            [ ! -d "${Dir_NixConfig}" ] && mkdir -p "${Dir_NixConfig}"
            backup_file $File_NixConf $File_NixConfBackup "nix.conf"
            ;;
        "${SYSTEM_VOID}")
            backup_dir $Dir_XbpsRepos $Dir_XbpsReposBackup "conf"
            ;;
        esac
    fi
}

function remove_original_mirrors() {
    function clear_file() {
        [ -f "$1" ] && sed -i '1,$d' "$1"
    }

    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
        [ -d "${Dir_AptAdditionalSources}" ] || mkdir -p $Dir_AptAdditionalSources
        if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_DEBIAN}" ]] && [ -f "${File_DebianSources}" ]; then
            clear_file $File_DebianSources
            USE_DEB822_FORMAT="true"
        fi
        if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_UBUNTU}" ]] && [ -f "${File_UbuntuSources}" ]; then
            clear_file $File_UbuntuSources
            USE_DEB822_FORMAT="true"
        fi
        if [[ "${USE_DEB822_FORMAT}" != "true" ]] && [[ "${SYSTEM_JUDGMENT}" != "${SYSTEM_LINUX_MINT}" ]]; then
            [ -s "${File_AptSourceList}" ] && clear_file $File_AptSourceList
        fi
        if [[ "${USE_DEB822_FORMAT}" == "true" ]] && [ -s "${File_AptSourceList}" ]]; then
            if [[ "${SOURCE_BRANCH}" ]]; then
                sed -e "/^deb\(-src\)\? http.*\/${SOURCE_BRANCH}/d" \
                    -e "/^#[[:space:]]*deb\(-src\)\? http.*\/${SOURCE_BRANCH}/d" \
                    -e "/^#.*\(默认禁用源码镜像以提高更新速度\|安全更新软件源\|预发布软件源\).*/d" \
                    -i \
                    $File_AptSourceList
            fi
        fi
        [ -f "${File_ArmbianRelease}" ] && clear_file $File_ArmbianSourceList
        if [ -f "${File_ProxmoxVersion}" ]; then
            if [[ "${USE_DEB822_FORMAT}" == "true" ]]; then
                clear_file $File_ProxmoxSources
                [ -f "${File_ProxmoxCephSources}" ] && clear_file $File_ProxmoxCephSources
            else
                clear_file $File_ProxmoxSourceList
                [ -f "${File_ProxmoxCephSourceList}" ] && clear_file $File_ProxmoxCephSourceList
            fi
        fi
        [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_LINUX_MINT}" ]] && clear_file $File_LinuxMintSourceList
        [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_RASPBERRY_PI_OS}" ]] && clear_file $File_RaspberryPiSourceList
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}")
        if [ ! -d "${Dir_YumRepos}" ]; then
            mkdir -p "${Dir_YumRepos}"
            return
        fi
        local -a repo_patterns=()
        if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_FEDORA}" ]]; then
            repo_patterns=(
                "fedora.repo"
                "fedora-updates.repo"
                "fedora-updates-testing.repo"
                "fedora-modular.repo"
                "fedora-updates-modular.repo"
                "fedora-updates-testing-modular.repo"
            )
        else
            if [[ "${ONLY_EPEL}" != "false" ]]; then
                return
            fi
            case "${SYSTEM_JUDGMENT}" in
            "${SYSTEM_RHEL}")
                case "${SYSTEM_VERSION_ID_MAJOR}" in
                7 | 8)
                    repo_patterns=("CentOS-*")
                    ;;
                *)
                    repo_patterns=(
                        "centos-stream.repo"
                        "centos-stream-addons.repo"
                    )
                    ;;
                esac
                ;;
            "${SYSTEM_CENTOS}")
                repo_patterns=("CentOS-*")
                ;;
            "${SYSTEM_CENTOS_STREAM}")
                case "${SYSTEM_VERSION_ID_MAJOR}" in
                9 | 10)
                    repo_patterns=(
                        "centos-stream.repo"
                        "centos-stream-addons.repo"
                    )
                    ;;
                8)
                    repo_patterns=("CentOS-Stream-*")
                    ;;
                esac
                ;;
            "${SYSTEM_ROCKY}")
                case "${SYSTEM_VERSION_ID_MAJOR}" in
                9)
                    repo_patterns=(
                        "rocky.repo"
                        "rocky-addons.repo"
                        "rocky-devel.repo"
                        "rocky-extras.repo"
                    )
                    ;;
                8)
                    repo_patterns=("Rocky-*")
                    ;;
                esac
                ;;
            "${SYSTEM_ALMALINUX}")
                repo_patterns=("almalinux*")
                ;;
            "${SYSTEM_ORACLE}")
                case "${SYSTEM_VERSION_ID_MAJOR}" in
                9 | 10)
                    repo_patterns=(
                        "*ol${SYSTEM_VERSION_ID_MAJOR}.repo"
                        "centos-stream.repo"
                        "centos-stream-addons.repo"
                    )
                    ;;
                8)
                    repo_patterns=(
                        "*ol${SYSTEM_VERSION_ID_MAJOR}.repo"
                        "CentOS-Stream-*"
                    )
                    ;;
                esac
                ;;
            "${SYSTEM_OPENCLOUDOS}")
                repo_patterns=("OpenCloudOS*")
                ;;
            "${SYSTEM_ANOLISOS}")
                repo_patterns=("AnolisOS*")
                ;;
            "${SYSTEM_OPENEULER}")
                repo_patterns=("openEuler.repo")
                ;;
            esac
        fi
        for pattern in "${repo_patterns[@]}"; do
            if [[ -n "$pattern" ]]; then
                eval "rm -rf $Dir_YumRepos/$pattern"
            fi
        done
        ;;
    "${SYSTEM_OPENSUSE}")
        if [ ! -d "${Dir_ZYppRepos}" ]; then
            mkdir -p "${Dir_ZYppRepos}"
            return
        fi
        rm -rf $Dir_ZYppRepos/repo-*
        rm -rf $Dir_ZYppRepos/openSUSE:repo-*
        rm -rf $Dir_ZYppRepos/download.opensuse.org-*
        ;;
    "${SYSTEM_ARCH}")
        clear_file $File_PacmanMirrorList
        if [[ "${SYSTEM_NAME}" == *"EndeavourOS"* ]] && [[ -f "${File_PacmanEndeavourOSMirrorList}" ]]; then
            clear_file $File_PacmanEndeavourOSMirrorList
        fi
        ;;
    "${SYSTEM_ALPINE}")
        clear_file $File_AlpineRepositories
        ;;
    "${SYSTEM_GENTOO}")
        clear_file $File_GentooReposConf
        ;;
    "${SYSTEM_VOID}")
        if [ ! -d "${Dir_XbpsRepos}" ]; then
            mkdir -p "${Dir_XbpsRepos}"
            return
        fi
        rm -rf $Dir_XbpsRepos/*-repository-*.conf
        ;;
    esac
}

function change_mirrors_main() {
    function print_diff() {
        function diff_file() {
            local diff_file=$1
            local origin_file=$2
            if [ -s "${diff_file}" ] && [ -s "${origin_file}" ]; then
                if [[ "$(cat "${diff_file}")" != "$(cat "${origin_file}")" ]]; then
                    echo -e "\n${BLUE}${diff_file}${PLAIN} -> ${BLUE}${origin_file}${PLAIN}"
                    diff "${diff_file}" "${origin_file}" -d --color=always -I -B -E
                fi
            fi
        }
        function diff_dir() {
            local diff_dir=$1
            local origin_dir=$2
            for item in $(ls $diff_dir | xargs); do
                diff_file "${diff_dir}/${item}" "${origin_dir}/${item}"
            done
        }

        if command_exists diff && [[ "${BACKED_UP}" == "true" ]]; then
            case "${SYSTEM_FACTIONS}" in
            "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
                if [[ "${USE_DEB822_FORMAT}" == "true" ]]; then
                    if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_DEBIAN}" ]]; then
                        diff_file $File_DebianSourcesBackup $File_DebianSources
                    fi
                    if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_UBUNTU}" ]]; then
                        diff_file $File_UbuntuSourcesBackup $File_UbuntuSources
                    fi
                else
                    if [[ "${SYSTEM_JUDGMENT}" != "${SYSTEM_LINUX_MINT}" ]]; then
                        diff_file $File_AptSourceListBackup $File_AptSourceList
                    fi
                fi
                if [ -f "${File_ArmbianRelease}" ]; then
                    diff_file $File_ArmbianSourceListBackup $File_ArmbianSourceList
                fi
                if [ -f "${File_ProxmoxVersion}" ]; then
                    if [[ "${USE_DEB822_FORMAT}" == "true" ]]; then
                        diff_file $File_ProxmoxSourcesBackup $File_ProxmoxSources
                        [ -f "${File_ProxmoxCephSources}" ] && diff_file $File_ProxmoxCephSourcesBackup $File_ProxmoxCephSources
                    else
                        diff_file $File_ProxmoxSourceListBackup $File_ProxmoxSourceList
                        [ -f "${File_ProxmoxCephSourceList}" ] && diff_file $File_ProxmoxCephSourceListBackup $File_ProxmoxCephSourceList
                    fi
                fi
                if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_LINUX_MINT}" ]]; then
                    diff_file $File_LinuxMintSourceListBackup $File_LinuxMintSourceList
                fi
                if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_RASPBERRY_PI_OS}" ]]; then
                    diff_file $File_RaspberryPiSourceListBackup $File_RaspberryPiSourceList
                fi
                ;;
            "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}")
                diff_dir $Dir_YumReposBackup $Dir_YumRepos
                ;;
            "${SYSTEM_OPENSUSE}")
                diff_dir $Dir_ZYppReposBackup $Dir_ZYppRepos
                ;;
            "${SYSTEM_ARCH}")
                diff_file $File_PacmanMirrorListBackup $File_PacmanMirrorList
                if [[ "${SYSTEM_NAME}" == *"EndeavourOS"* ]] && [[ -f "${File_PacmanEndeavourOSMirrorList}" ]]; then
                    diff_file $File_PacmanEndeavourOSMirrorListBackup $File_PacmanEndeavourOSMirrorList
                fi
                ;;
            "${SYSTEM_ALPINE}")
                diff_file $File_AlpineRepositoriesBackup $File_AlpineRepositories
                ;;
            "${SYSTEM_GENTOO}")
                diff_file $File_GentooMakeConfBackup $File_GentooMakeConf
                diff_file $File_GentooReposConfBackup $File_GentooReposConf
                ;;
            "${SYSTEM_NIXOS}")
                diff_file $File_NixConfBackup $File_NixConf
                ;;
            "${SYSTEM_VOID}")
                diff_dir $Dir_XbpsReposBackup $Dir_XbpsRepos
                ;;
            esac
        fi
    }
    if [[ -z "${SOURCE}" ]]; then
        USE_OFFICIAL_SOURCE="true"
    fi
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}")
        change_mirrors_Debian
        ;;
    "${SYSTEM_REDHAT}")
        change_mirrors_RedHat
        ;;
    "${SYSTEM_OPENEULER}")
        change_mirrors_openEuler
        ;;
    "${SYSTEM_OPENCLOUDOS}")
        change_mirrors_OpenCloudOS
        ;;
    "${SYSTEM_OPENKYLIN}")
        change_mirrors_openKylin
        ;;
    "${SYSTEM_ANOLISOS}")
        change_mirrors_AnolisOS
        ;;
    "${SYSTEM_OPENSUSE}")
        change_mirrors_openSUSE
        ;;
    "${SYSTEM_ARCH}")
        change_mirrors_ArchLinux
        ;;
    "${SYSTEM_ALPINE}")
        change_mirrors_Alpine
        ;;
    "${SYSTEM_GENTOO}")
        change_mirrors_Gentoo
        ;;
    "${SYSTEM_NIXOS}")
        change_mirrors_NixOS
        ;;
    "${SYSTEM_VOID}")
        change_mirrors_Void
        ;;
    esac
    if [[ "${PRINT_DIFF}" == "true" ]]; then
        print_diff
    fi
    local -a commands=()
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
        commands+=("apt-get update")
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}")
        local package_manager="$(get_package_manager)"
        commands+=("${package_manager} makecache")
        ;;
    "${SYSTEM_OPENSUSE}")
        commands+=("zypper ref")
        ;;
    "${SYSTEM_ARCH}")
        commands+=("pacman -Sy")
        ;;
    "${SYSTEM_ALPINE}")
        commands+=("apk update -f")
        ;;
    "${SYSTEM_GENTOO}")
        commands+=("emerge --sync --quiet")
        ;;
    "${SYSTEM_NIXOS}")
        commands+=("nix-store --verify")
        commands+=("nix-channel --update")
        ;;
    "${SYSTEM_VOID}")
        commands+=("xbps-install -S")
        ;;
    esac
    if [[ "${PURE_MODE}" == "true" ]]; then
        local exec_cmd=""
        for cmd in "${commands[@]}"; do
            if [[ -z "${exec_cmd}" ]]; then
                exec_cmd="${cmd}"
            else
                exec_cmd="${exec_cmd} ; ${cmd}"
            fi
        done
        echo ''
        animate_exec "${exec_cmd}" "${SYNC_MIRROR_TEXT}"
        if [ $? -ne 0 ]; then
            echo ''
            exit 1
        fi
    else
        echo -e "\n$WORKING ${SYNC_MIRROR_TEXT}...\n"
        for cmd in "${commands[@]}"; do
            eval "${cmd}"
        done
        if [ $? -eq 0 ]; then
            echo -e "\n$SUCCESS $(msg "source.changeResult.success")"
        else
            echo -e "\n$FAIL $(msg "source.changeResult.fail" "${SYNC_MIRROR_TEXT}")"
            echo -e "\n$TIP $(msg "source.changeResult.tipTitle" "${SYNC_MIRROR_TEXT}")"
            echo -e "\n1. $(msg "source.changeResult.tip1")"
            echo -e "2. $(msg "source.changeResult.tip2" "${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}")"
            echo -e "      $(msg "source.changeResult.tip2.1")"
            echo -e "      $(msg "source.changeResult.tip2.2")"
            echo -e "      $(msg "source.changeResult.tip2.3")"
            echo -e "3. $(msg "source.changeResult.tip3")\n"
            exit 1
        fi
    fi
}

function upgrade_software() {
    case "${SYSTEM_JUDGMENT}" in
    "${SYSTEM_RHEL}" | "${SYSTEM_ORACLE}")
        return
        ;;
    esac
    local ask_text=""
    if [[ -z "${UPGRADE_SOFTWARE}" ]]; then
        UPGRADE_SOFTWARE="false"
        ask_text="$(msg "interaction.upgrade.skip")?"
        if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
            echo ''
            interactive_select_boolean "${BOLD}${ask_text}${PLAIN}"
            if [[ "${_SELECT_RESULT}" == "false" ]]; then
                UPGRADE_SOFTWARE="true"
            fi
        else
            local CHOICE="$(echo -e "\n${BOLD}└─ ${ask_text} [Y/n] ${PLAIN}")"
            read -rp "${CHOICE}" INPUT
            [[ -z "${INPUT}" ]] && INPUT=Y
            case "${INPUT}" in
            [Yy] | [Yy][Ee][Ss]) ;;
            [Nn] | [Nn][Oo])
                UPGRADE_SOFTWARE="true"
                ;;
            *)
                input_error "$(msg "error.defaultBehavior.noUpdate")"
                ;;
            esac
        fi
    fi
    if [[ "${UPGRADE_SOFTWARE}" == "false" ]]; then
        return
    fi
    if [[ -z "${CLEAN_CACHE}" ]]; then
        CLEAN_CACHE="false"
        ask_text="$(msg "interaction.cache.autoClean")?"
        if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
            echo ''
            interactive_select_boolean "${BOLD}${ask_text}${PLAIN}"
            if [[ "${_SELECT_RESULT}" == "true" ]]; then
                CLEAN_CACHE="true"
            fi
        else
            local CHOICE="$(echo -e "\n${BOLD}└─ ${ask_text} [Y/n] ${PLAIN}")"
            read -rp "${CHOICE}" INPUT
            [[ -z "${INPUT}" ]] && INPUT=Y
            case "${INPUT}" in
            [Yy] | [Yy][Ee][Ss])
                CLEAN_CACHE="true"
                ;;
            [Nn] | [Nn][Oo]) ;;
            *)
                input_error "$(msg "error.defaultBehavior.noClean")"
                ;;
            esac
        fi
    fi
    local -a commands=()
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
        commands+=("apt-get upgrade -y")
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}")
        local package_manager="$(get_package_manager)"
        commands+=("${package_manager} upgrade -y")
        ;;
    "${SYSTEM_OPENSUSE}")
        commands+=("zypper update -y")
        ;;
    "${SYSTEM_ARCH}")
        commands+=("pacman -Syu --noconfirm")
        ;;
    "${SYSTEM_ALPINE}")
        commands+=("apk upgrade --no-cache")
        ;;
    "${SYSTEM_GENTOO}")
        commands+=("emerge --update --deep --with-bdeps=y --ask=n @world")
        ;;
    "${SYSTEM_NIXOS}")
        commands+=("nixos-rebuild switch")
        ;;
    "${SYSTEM_VOID}")
        commands+=("xbps-install -yu")
        ;;
    esac
    if [[ "${PURE_MODE}" == "true" ]]; then
        local exec_cmd=""
        for cmd in "${commands[@]}"; do
            if [[ -z "${exec_cmd}" ]]; then
                exec_cmd="${cmd}"
            else
                exec_cmd="${exec_cmd} ; ${cmd}"
            fi
        done
        echo ''
        animate_exec "${exec_cmd}" "$(msg "work.upgradeSoftware")"
    else
        echo ''
        for cmd in "${commands[@]}"; do
            eval "${cmd}"
        done
    fi
    if [[ "${CLEAN_CACHE}" == "false" ]]; then
        return
    fi
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
        apt-get autoremove -y >/dev/null 2>&1
        apt-get clean >/dev/null 2>&1
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}")
        local package_manager="$(get_package_manager)"
        $package_manager autoremove -y >/dev/null 2>&1
        $package_manager clean packages -y >/dev/null 2>&1
        ;;
    "${SYSTEM_OPENSUSE}")
        rm -rf /var/cache/zypp/* >/dev/null 2>&1
        ;;
    "${SYSTEM_ARCH}")
        pacman -Scc --noconfirm >/dev/null 2>&1
        ;;
    "${SYSTEM_ALPINE}")
        rm -rf /var/cache/apk/* >/dev/null 2>&1
        ;;
    "${SYSTEM_GENTOO}")
        eclean-dist --deep >/dev/null 2>&1
        eclean-packages --deep >/dev/null 2>&1
        ;;
    "${SYSTEM_NIXOS}")
        nix-collect-garbage -d >/dev/null 2>&1
        ;;
    "${SYSTEM_VOID}")
        xbps-remove -O >/dev/null 2>&1
        ;;
    esac
}

MESSAGE_LANG_DEFAULT='zh-hans'
MESSAGE_LANG_KEYS=(
    "zh-hans"
    "zh-hant"
    "en"
)
declare -A MESSAGE_LANG_DISPLAY=(
    ['zh-hans']='简体中文'
    ['zh-hant']='繁體中文'
    ['en']='English'
)
declare -A MESSAGE_CONTENTS

function msg() {
    local key="$1"
    shift
    local text="${MESSAGE_CONTENTS[${key}]}"
    if [[ -z "${text}" ]]; then
        echo "${key}"
        return
    fi
    while [[ $# -gt 0 ]]; do
        if [[ "${text}" == *"{}"* ]]; then
            text="${text/\{\}/$1}"
        else
            break
        fi
        shift
    done
    echo "${text}"
}

function init_msg_pack() {
    function load_pack() {
        local func_name="${1}"
        if declare -f "${func_name}" >/dev/null 2>&1; then
            eval "${func_name}"
        fi
    }
    local current_lang="${1:-${MESSAGE_LANG_DEFAULT}}"
    current_lang="$(echo "${current_lang}" | sed 's/^-*//')"
    current_lang="${current_lang,,}"
    if [[ "${MESSAGE_LANG_DISPLAY[${current_lang}]}" ]]; then
        current_lang="${current_lang//-/_}"
        load_pack "msg_pack_${current_lang}"
    fi
}

init_msg_pack
handle_command_options "$@"
main
