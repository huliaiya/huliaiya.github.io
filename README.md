<div align="center">

<img src="assets/logo.png" width="120" height="120" style="border-radius: 50%;" />

# 📦 Huli 资源仓库

**为手机容器 / Linux 环境准备的一键脚本与工具集合**

无需复杂配置，复制命令即可使用

<br>

[![访问资源页面](https://img.shields.io/badge/🌐_访问资源页面-6366f1?style=for-the-badge&logo=data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='white'%3E%3Cpath d='M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-1 17.93c-3.95-.49-7-3.85-7-7.93 0-.62.08-1.21.21-1.79L9 15v1c0 1.1.9 2 2 2v1.93zm6.9-2.54c-.26-.81-1-1.39-1.9-1.39h-1v-3c0-.55-.45-1-1-1H8v-2h2c.55 0 1-.45 1-1V7h2c1.1 0 2-.9 2-2v-.41c2.93 1.19 5 4.06 5 7.41 0 2.08-.8 3.97-2.1 5.39z'/%3E%3C/svg%3E)](https://huliaiya.github.io/)
[![GitHub](https://img.shields.io/badge/GitHub-333?style=for-the-badge&logo=github&logoColor=white)](https://github.com/huliaiya/huliaiya.github.io)

</div>

---

## 📋 目录

- [📦 脚本列表](#-脚本列表)
- [🌐 Chromium 一键安装脚本](#-chromium-一键安装脚本)
- [🔄 Linux 一键换源脚本](#-linux-一键换源脚本)
- [💖 赞助支持](#-赞助支持)

---

## 📦 脚本列表

| 图标 | 脚本 | 说明 | 适用系统 |
|:---:|--------|------|---------|
| 🌐 | [chromium.sh](scripts/chromium.sh) | Chromium 一键安装 / 更新 · 自动去 snap · 国内镜像 · 版本锁定 | Debian / Ubuntu |
| 🔄 | [change-mirrors.sh](scripts/change-mirrors.sh) | Linux 一键换源 · 支持 30+ 发行版 · 国内/教育/海外镜像 · 自动备份 | Debian/Ubuntu/CentOS/RHEL/Fedora/Arch/Alpine/Gentoo/openSUSE 等 |

---

## 🌐 Chromium 一键安装脚本

### 🚀 一键执行命令

```bash
curl -sL https://huliaiya.github.io/scripts/chromium.sh -o /tmp/chromium.sh && sudo bash /tmp/chromium.sh
```

> 💡 **操作提示**：用鼠标选中上面的命令 → 右键复制 → 粘贴到终端回车

### 📝 使用步骤

| 步骤 | 说明 |
|------|------|
| **Step 1** | 确保设备已安装 **curl** 和 **sudo**（手机容器请先进入 Debian/Ubuntu 环境） |
| **Step 2** | 复制上面的一键命令，粘贴到终端执行 |
| **Step 3** | 根据提示选择 **1.安装** 或 **2.更新**（默认 1，30 秒自动确认） |
| **Step 4** | 等待安装完成，脚本会自动验证版本、路径、运行状态并锁定版本 |

### ⚙️ 脚本特性

| 特性 | 说明 |
|------|------|
| 🌐 智能镜像 | 自动检测国内/国外网络，国内走 USTC 镜像，国外走官方源 |
| 🚫 防 snap | 自动屏蔽 snap 版 chromium-browser，确保安装原生 deb 包 |
| 🔗 依赖解析 | 递归解析所有依赖并设置高优先级，避免依赖冲突 |
| 📊 进度显示 | 带进度条、旋转动画和实时状态，过程一目了然 |
| 🔄 失败重试 | 网络下载失败自动重试最多 3 次 |
| 🔒 版本锁定 | 安装完成后自动 apt-mark hold，防止系统更新破坏 |

### ⚠️ 注意事项

- 此脚本仅支持 **Debian / Ubuntu** 系发行版
- 需以 **root** 或 **sudo** 运行
- 适用于：手机 proot 容器、Linux Deploy、Termux 的 proot-distro 等环境

---

## 🔄 Linux 一键换源脚本

### 🚀 一键执行命令

```bash
curl -sL https://huliaiya.github.io/scripts/change-mirrors.sh -o /tmp/change-mirrors.sh && sudo bash /tmp/change-mirrors.sh
```

> 💡 **操作提示**：用鼠标选中上面的命令 → 右键复制 → 粘贴到终端回车

### 📝 使用步骤

| 步骤 | 说明 |
|------|------|
| **Step 1** | 确保设备已安装 **curl** 和 **sudo**，需以 root 或 sudo 权限运行 |
| **Step 2** | 复制上面的一键命令，粘贴到终端执行 |
| **Step 3** | 根据提示选择镜像类型（默认/教育网/海外）、协议（http/https）等 |
| **Step 4** | 脚本自动备份原配置、替换源、升级软件，完成后输出结果 |

### ⚙️ 脚本特性

| 特性 | 说明 |
|------|------|
| 🖥️ 多发行版 | 支持 Debian/Ubuntu/CentOS/RHEL/Fedora/Arch/Alpine/Gentoo/openSUSE 等 30+ 发行版 |
| 🌐 多镜像源 | 内置阿里云、腾讯云、华为云、清华、中科大、浙大等 18+ 国内主流镜像 |
| 🏫 教育网支持 | 支持教育网镜像（清华、北大、浙大、上交、华科等），校园网用户首选 |
| 🌍 海外镜像 | 支持海外官方源模式，适合境外服务器使用 |
| 🔐 协议选择 | 支持 http / https 协议自由切换 |
| 💾 自动备份 | 替换前自动备份原软件源配置，随时可恢复 |
| 📦 EPEL 支持 | CentOS/RHEL 可选择安装 EPEL 扩展源 |
| ⬆️ 软件升级 | 换源完成后可选择是否一键升级全部软件包 |

### ⚠️ 注意事项

- 支持大多数主流 **Linux** 发行版（Debian/Ubuntu/CentOS/RHEL/Fedora/Arch/Alpine/Gentoo/openSUSE 等）
- 需以 **root** 或 **sudo** 运行
- 脚本会自动备份原始配置，如有问题可手动恢复备份文件

---

<div align="center">

## 💖 赞助支持

**如果这些工具对你有帮助，欢迎请作者喝杯咖啡 ☕**

你的支持是持续更新的动力 ❤️

</div>

<div align="center">

| 💙 支付宝 | 💚 微信 | 💖 爱发电 |
|:---:|:---:|:---:|
| <img src="assets/alipay.png" width="160" height="160" alt="支付宝收款码" /> | <img src="assets/wechat.png" width="160" height="160" alt="微信收款码" /> | <img src="assets/afdian.png" width="160" height="160" alt="爱发电主页码" /> |

</div>

<div align="center">

[![爱发电主页](https://img.shields.io/badge/💖_前往爱发电主页-ff69b4?style=for-the-badge)](https://www.ifdian.net/a/hulihulihuli)

扫码后请备注你的昵称，感谢支持 ❤️

</div>

---

<div align="center">

Made with 🔥 and ❤️ by **Huli**

</div>
