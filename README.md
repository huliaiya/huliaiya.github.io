<style>
  @keyframes flowRainbow {
    0% { background-position: 0% 50%; }
    100% { background-position: -300% 50%; }
  }
  @-webkit-keyframes flowRainbow {
    0% { background-position: 0% 50%; }
    100% { background-position: -300% 50%; }
  }
  .rainbow-text {
    background: linear-gradient(270deg, #f06292, #ba68c8, #64b5f6, #4fc3f7, #4dd0e1, #81c784, #aed581, #ffb74d, #ff8a65, #e57373, #f06292);
    background-size: 300% auto;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    animation: flowRainbow 8s linear infinite;
    -webkit-animation: flowRainbow 8s linear infinite;
  }
  .glass-card {
    background: rgba(255, 255, 255, 0.7);
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
    border-radius: 24px;
    border: 1px solid rgba(255, 255, 255, 0.8);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.08);
    padding: 2rem;
    margin: 1.5rem 0;
  }
  .btn-rainbow {
    display: inline-block;
    padding: 12px 28px;
    border-radius: 999px;
    font-weight: 700;
    font-size: 14.5px;
    text-decoration: none;
    color: #fff;
    background: linear-gradient(135deg, #a855f7, #6366f1);
    box-shadow: 0 6px 20px rgba(139, 92, 246, 0.35);
  }
  .sponsor-card {
    display: inline-block;
    width: 30%;
    min-width: 200px;
    text-align: center;
    background: rgba(255, 255, 255, 0.75);
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
    border-radius: 24px;
    border: 1px solid rgba(255, 255, 255, 0.85);
    padding: 1.8rem 1rem;
    margin: 0.5rem;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.08);
    vertical-align: top;
  }
  .sponsor-card img {
    width: 160px;
    height: 160px;
    object-fit: contain;
    border-radius: 12px;
  }
  .cmd-block {
    background: #0f172a;
    border-radius: 12px;
    padding: 18px 20px;
    color: #e2e8f0;
    font-family: "JetBrains Mono", "Fira Code", Consolas, monospace;
    font-size: 13.5px;
    line-height: 1.7;
    word-break: break-all;
    overflow-x: auto;
  }
  .feature-table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 8px;
  }
  .feature-table td {
    padding: 14px 18px;
    background: rgba(255, 255, 255, 0.5);
  }
  .feature-table td:first-child {
    border-radius: 12px 0 0 12px;
    font-weight: 700;
    width: 160px;
  }
  .feature-table td:last-child {
    border-radius: 0 12px 12px 0;
  }
</style>

<div align="center">

<img src="assets/logo.png" width="120" height="120" style="border-radius: 50%;" />

# <span class="rainbow-text">📦 Huli 资源仓库</span>

**为手机容器 / Linux 环境准备的一键脚本与工具集合**
<br>
无需复杂配置，复制命令即可使用

<br>

<a href="https://huliaiya.github.io/" class="btn-rainbow">🌐 访问资源页面</a>
&nbsp;&nbsp;
<a href="https://github.com/huliaiya/huliaiya.github.io" style="display: inline-block; padding: 12px 28px; border-radius: 999px; font-weight: 700; font-size: 14.5px; text-decoration: none; color: #475569; background: rgba(255,255,255,0.7); border: 1px solid rgba(255,255,255,0.8);">
  🐙 GitHub
</a>

</div>

---

## 📋 目录

- [📦 脚本列表](#-脚本列表)
- [🌐 Chromium 一键安装脚本](#-chromium-一键安装脚本)
- [💖 赞助支持](#-赞助支持)

---

## 📦 脚本列表

<div class="glass-card">

| 图标 | 脚本 | 说明 | 适用系统 |
|:---:|--------|------|---------|
| 🌐 | [chromium.sh](scripts/chromium.sh) | Chromium 一键安装 / 更新 · 自动去 snap · 国内镜像 · 版本锁定 | Debian / Ubuntu |

</div>

---

## 🌐 Chromium 一键安装脚本

<div class="glass-card">

<div align="center">

### 🚀 一键执行命令

</div>

<div class="cmd-block">curl -sL https://huliaiya.github.io/scripts/chromium.sh -o /tmp/chromium.sh && sudo bash /tmp/chromium.sh</div>

> 💡 **操作提示**：用鼠标选中上面的命令 → 右键复制 → 粘贴到终端回车

---

### 📝 使用步骤

<table class="feature-table">
  <tr><td>**Step 1**</td><td>确保设备已安装 <b>curl</b> 和 <b>sudo</b>（手机容器请先进入 Debian/Ubuntu 环境）</td></tr>
  <tr><td>**Step 2**</td><td>复制上面的一键命令，粘贴到终端执行</td></tr>
  <tr><td>**Step 3**</td><td>根据提示选择 <b>1.安装</b> 或 <b>2.更新</b>（默认 1，30 秒自动确认）</td></tr>
  <tr><td>**Step 4**</td><td>等待安装完成，脚本会自动验证版本、路径、运行状态并锁定版本</td></tr>
</table>

---

### ⚙️ 脚本特性

<table class="feature-table">
  <tr><td>🌐 智能镜像</td><td>自动检测国内/国外网络，国内走 USTC 镜像，国外走官方源</td></tr>
  <tr><td>🚫 防 snap</td><td>自动屏蔽 snap 版 chromium-browser，确保安装原生 deb 包</td></tr>
  <tr><td>🔗 依赖解析</td><td>递归解析所有依赖并设置高优先级，避免依赖冲突</td></tr>
  <tr><td>📊 进度显示</td><td>带进度条、旋转动画和实时状态，过程一目了然</td></tr>
  <tr><td>🔄 失败重试</td><td>网络下载失败自动重试最多 3 次</td></tr>
  <tr><td>🔒 版本锁定</td><td>安装完成后自动 apt-mark hold，防止系统更新破坏</td></tr>
</table>

---

### ⚠️ 注意事项

> - 此脚本仅支持 **Debian / Ubuntu** 系发行版
> - 需以 **root** 或 **sudo** 运行
> - 适用于：手机 proot 容器、Linux Deploy、Termux 的 proot-distro 等环境

</div>

---

<div align="center">

## 💖 赞助支持

**如果这些工具对你有帮助，欢迎请作者喝杯咖啡 ☕**
<br>
你的支持是持续更新的动力 ❤️

</div>

<div align="center">

<div class="sponsor-card">
  <div style="font-size: 15px; font-weight: 700; color: #1677ff; margin-bottom: 10px;">💙 支付宝</div>
  <img src="assets/alipay.png" alt="支付宝收款码" />
</div>

<div class="sponsor-card">
  <div style="font-size: 15px; font-weight: 700; color: #07c160; margin-bottom: 10px;">💚 微信</div>
  <img src="assets/wechat.png" alt="微信收款码" />
</div>

<div class="sponsor-card">
  <div style="font-size: 15px; font-weight: 700; color: #a855f7; margin-bottom: 10px;">💖 爱发电</div>
  <img src="assets/afdian.png" alt="爱发电主页码" />
  <br><br>
  <a href="https://www.ifdian.net/a/hulihulihuli" class="btn-rainbow" style="padding: 8px 20px; font-size: 13px;">💖 前往主页</a>
</div>

</div>

<div align="center" style="margin-top: 1rem; color: #64748b; font-size: 14px; line-height: 1.8;">

  扫码后请备注你的昵称，感谢支持 ❤️

</div>

---

<div align="center" style="color: #94a3b8; font-size: 13px; margin-top: 2rem;">

  Made with 🔥 and ❤️ by **Huli**

</div>
