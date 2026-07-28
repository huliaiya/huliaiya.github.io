<div align="center">

# 🦊 Huli

**一个简洁优雅的 Android 应用管理器**

![Android](https://img.shields.io/badge/Android-5.0+-2ea44f?logo=android)
![Java](https://img.shields.io/badge/Java-17-ED8B00?logo=openjdk)
![Status](https://img.shields.io/badge/status-开发中-yellow)
[![爱发电](https://img.shields.io/badge/爱发电-支持创作者-ff69b4)](https://www.ifdian.net/a/hulihulihuli)

[功能特性](#功能特性) · [界面预览](#界面预览) · [技术栈](#技术栈) · [开发路线](#开发路线) · [支持作者](#支持作者)

</div>

---

## 📖 项目简介

Huli 是一款正在开发中的 Android 应用管理工具，致力于为用户提供简洁、高效、美观的应用管理体验。

项目采用 Material Design 设计语言，集成液态玻璃（Liquid Glass）视觉效果，支持深色/浅色主题切换，目标是打造一个既实用又赏心悦目的工具类应用。

> 💡 **关于名字**：Huli 取自「狐狸」的拼音，寓意敏捷、聪慧，希望这款工具能像狐狸一样灵动高效。

---

## ✨ 功能特性

### 已实现
- 🎨 **液态玻璃设计** — 全应用覆盖半透明模糊玻璃质感，Android 12+ 硬件加速实时渲染
- 🌓 **主题切换** — 支持跟随系统 / 浅色模式 / 深色模式三种主题方案
- 📱 **侧边栏导航** — 基于 Navigation Drawer 实现流畅的抽屉式导航
- 🧩 **模块化架构** — Fragment + ViewModel 清晰分层，易于扩展

### 开发中
- 📦 **应用列表管理** — 查看所有已安装应用，支持搜索、排序
- 🗑️ **批量卸载** — 一键卸载多个应用，省去找寻的烦恼
- 📊 **应用信息详情** — 包名、版本、权限、存储占用等完整信息
- 🚀 **应用快捷操作** — 启动、分享、导出 APK、打开设置
- 🔖 **应用分类收藏** — 自定义分组，快速找到常用应用
- 🔒 **权限管理** — 查看和管理应用权限申请情况

### 规划中
- 🌐 **多语言支持**
- ☁️ **应用列表云同步**
- 📈 **使用时长统计**
- 🔔 **更新提醒**

---

## 🎨 界面预览

| 页面 | 说明 |
|------|------|
| 🏠 **首页** | 应用概览、快捷入口、统计卡片 |
| 📋 **应用列表** | 全部 / 用户 / 系统 应用分类展示 |
| ⚙️ **设置** | 外观主题、偏好设置、关于信息 |

设计风格采用半透明玻璃卡片 + 柔和阴影，整体视觉轻盈通透，深色模式下同样表现出色。

---

## 🛠️ 技术栈

| 类别 | 技术 |
|------|------|
| **语言** | Java 17 |
| **构建工具** | Gradle 9.0 + AGP 8.13 |
| **最低版本** | Android 5.0 (API 21) |
| **目标版本** | Android 14 (API 34) |
| **UI 框架** | Material Design Components |
| **导航** | Navigation Component |
| **架构** | MVVM (ViewModel + LiveData) |
| **视图绑定** | ViewBinding |
| **视觉特效** | RenderEffect (Android 12+) 实时模糊 |

---

## 🗺️ 开发路线

```
v0.1.0  ──  项目搭建 + 基础框架 + 主题系统  ✅ 已完成
v0.2.0  ──  应用列表模块 + 搜索功能           🚧 开发中
v0.3.0  ──  应用详情页 + 批量操作             📋 规划中
v0.4.0  ──  应用分类 + 收藏功能               📋 规划中
v1.0.0  ──  正式发布                           🌟 未来
```

---

## 💖 支持作者

这个项目由我个人在业余时间独立开发，如果你觉得这个项目对你有帮助，或者期待它的后续功能，欢迎通过以下方式支持我：

<div align="center">

### [❤️ 在爱发电上赞助我](https://www.ifdian.net/a/hulihulihuli)

你的每一份支持都是我持续更新的动力 ☕

</div>

---

## 📝 更新日志

### 2026-07-28
- ✨ 实现全应用液态玻璃视觉效果（基于 RenderEffect 硬件加速模糊）
- 🌓 新增深色/浅色主题切换，支持跟随系统
- 🎨 优化 Toolbar 半透明显示，修复浅色模式图标不可见问题
- 🔧 修复 Android 16 预览版 SDK 导致的 AAPT2 构建错误
- 🔧 统一 compileSdk / targetSdk 至 34，稳定构建环境
- 🔧 多项 UI 细节优化和代码质量改进

### 2026-07-27
- 🎉 项目初始化，基于 Navigation Drawer 模板搭建基础框架

---

<div align="center">

Made with ❤️ by huli

[![爱发电](https://img.shields.io/badge/爱发电-hulihulihuli-ff69b4?style=flat-square)](https://www.ifdian.net/a/hulihulihuli)

</div>
