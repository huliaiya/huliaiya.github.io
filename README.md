# 📦 Huli 资源仓库

> 为手机容器 / Linux 环境准备的一键脚本与工具集合

## 📚 资源列表

| 脚本 | 说明 | 适用系统 |
|------|------|---------|
| [chromium.sh](scripts/chromium.sh) | Chromium 一键安装 / 更新脚本（自动去 snap、国内镜像、版本锁定） | Debian / Ubuntu（手机容器） |

## 🚀 快速开始

### Chromium 一键安装

复制以下命令到终端执行即可：

```bash
curl -sL https://huliaiya.github.io/scripts/chromium.sh | sudo bash
```

> 💡 访问 [资源页面](https://huliaiya.github.io/) 获取带一键复制按钮的可视化版本。

## 📝 脚本特性

### chromium.sh

- 🌐 **智能镜像**：自动检测国内/国外网络，国内走 USTC 镜像
- 🚫 **防 snap**：自动屏蔽 snap 版 chromium-browser，安装原生 deb 包
- 🔗 **依赖解析**：递归解析所有依赖并设置优先级，避免冲突
- 📊 **进度显示**：进度条 + 旋转动画，过程一目了然
- 🔄 **失败重试**：网络失败自动重试最多 3 次
- 🔒 **版本锁定**：安装后自动 hold，防止系统更新破坏

---

Made with ❤️ by Huli
