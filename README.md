<div align="center">

<img src="assets/logo.png" width="120" height="120" style="border-radius: 50%;" />

# 📦 Huli 资源仓库

> **为手机容器 / Linux 环境准备的一键脚本与工具集合**
>
> 无需复杂配置，复制命令即可使用

[![访问资源页面](https://img.shields.io/badge/🌐_访问资源页面-purple?style=for-the-badge)](https://huliaiya.github.io/)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/huliaiya/huliaiya.github.io)

</div>

---

## 📋 目录

- [📦 脚本列表](#-脚本列表)
- [🌐 Chromium 一键安装脚本](#-chromium-一键安装脚本)
- [💖 赞助支持](#-赞助支持)

---

## 📦 脚本列表

| 图标 | 脚本 | 说明 | 适用系统 |
|:---:|--------|------|---------|
| 🌐 | [chromium.sh](scripts/chromium.sh) | Chromium 一键安装 / 更新<br>自动去 snap · 国内镜像 · 版本锁定 | ![Debian](https://img.shields.io/badge/-Debian-red) ![Ubuntu](https://img.shields.io/badge/-Ubuntu-orange) |

---

## 🌐 Chromium 一键安装脚本

<div align="center">

### 🚀 一键执行命令

</div>

```bash
curl -sL https://huliaiya.github.io/scripts/chromium.sh | sudo bash
```

> 💡 **操作提示**：用鼠标选中上面的命令 → 右键复制 → 粘贴到终端回车

---

### 📝 使用步骤

| 步骤 | 操作 |
|:---:|------|
| **1** | 确保设备已安装 **curl** 和 **sudo**（手机容器请先进入 Debian/Ubuntu 环境） |
| **2** | 复制上面的一键命令，粘贴到终端执行 |
| **3** | 根据提示选择 **1.安装** 或 **2.更新**（默认 1，30 秒自动确认） |
| **4** | 等待安装完成，脚本会自动验证版本、路径、运行状态并锁定版本 |

---

### ⚙️ 脚本特性

| 特性 | 说明 |
|------|------|
| 🌐 **智能镜像** | 自动检测国内/国外网络，国内走 USTC 镜像，国外走官方源 |
| 🚫 **防 snap** | 自动屏蔽 snap 版 chromium-browser，确保安装原生 deb 包 |
| 🔗 **依赖解析** | 递归解析所有依赖并设置高优先级，避免依赖冲突 |
| 📊 **进度显示** | 带进度条、旋转动画和实时状态，过程一目了然 |
| 🔄 **失败重试** | 网络下载失败自动重试最多 3 次 |
| 🔒 **版本锁定** | 安装完成后自动 apt-mark hold，防止系统更新破坏 |

---

### ⚠️ 注意事项

> - 此脚本仅支持 **Debian / Ubuntu** 系发行版
> - 需以 **root** 或 **sudo** 运行
> - 适用于：手机 proot 容器、Linux Deploy、Termux 的 proot-distro 等环境

---

<div align="center">

## 💖 赞助支持

**如果这些工具对你有帮助，欢迎请作者喝杯咖啡 ☕**
<br>
你的支持是持续更新的动力 ❤️

</div>

<br>

<div align="center">

| 💙 支付宝 | 💚 微信 | 💖 爱发电 |
|:---:|:---:|:---:|
| <img src="assets/alipay.png" width="180" /> | <img src="assets/wechat.png" width="180" /> | <img src="assets/afdian.png" width="180" /> |

</div>

<br>

<div align="center">

[![爱发电主页](https://img.shields.io/badge/💖_前往爱发电主页-purple?style=for-the-badge)](https://www.ifdian.net/a/hulihulihuli)

<br>

> 扫码后请备注你的昵称，感谢支持 ❤️

</div>

---

<div align="center">

Made with 🔥 and ❤️ by **Huli**

</div>
