<p align="center">
  <img src="assets/logo.png" alt="Huli Logo" style="width: 120px; height: 120px; border-radius: 50%; object-fit: cover; box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3); border: 4px solid #fff;" />
</p>

<h1 align="center">🦊 Huli</h1>

<p align="center">
  <b>新一代 Android 病毒检测 & 安全防护引擎</b>
</p>

<p align="center">
  <i>多引擎云查杀 · Root/LSPosed/Shizuku 三模深度检测 · 为你的设备保驾护航</i>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Android-7.0+-2ea44f?logo=android&style=for-the-badge" />
  <img src="https://img.shields.io/badge/🛡️_病毒检测-70+引擎-00d4aa?style=for-the-badge" />
  <img src="https://img.shields.io/badge/🧩_LSPosed-支持-7c4dff?style=for-the-badge" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/⚡_Root-可选-ff4444?style=for-the-badge&logo=superuser" />
  <img src="https://img.shields.io/badge/🔌_Shizuku-支持-00bfff?style=for-the-badge" />
  <img src="https://img.shields.io/badge/🔥-Alpha_开发中-orange?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Made_with-❤️-ff69b4?style=for-the-badge" />
</p>

---

## 📖 关于 Huli

**Huli（狐狸）是一款专为 Android 设备打造的新一代病毒检测与安全防护引擎。**

你是否担心过这些问题？

| 威胁场景 | 你的设备是否安全？ |
|---------|-------------|
| 🦠 **木马病毒** | 手机是不是被偷偷植入了木马、勒索软件？ |
| 🕵️ **间谍软件** | 有没有应用在窃取你的短信、通话记录、位置？ |
| 🎮 **远控后门** | 设备是不是被 TeamViewer、向日葵、RAT工具远控了？ |
| 📤 **恶意上传** | 有没有 App 在后台偷偷上传你的照片、视频、通讯录？ |
| 🧩 **模块注入** | Magisk / LSPosed 模块有没有被植入恶意代码？ |
| 🔑 **密码泄露** | 你保存的密码是不是已经在数据泄露事件中被公开？ |
| 📡 **隐私窥探** | 有没有应用在后台偷偷调用摄像头、麦克风、剪贴板？ |
| 💣 **系统篡改** | 系统分区文件是不是被替换、patch或注入了恶意代码？ |

**Huli 就是为了解决这些问题而生的。**

我们整合了 **VirusTotal、Hybrid Analysis、MetaDefender** 等全球顶级云端扫描引擎（70+ 杀毒引擎联合检测），配合 **Root / LSPosed / Shizuku** 三种检测模式的深度权限，为你的 Android 设备提供**从应用层到系统层的全方位安全体检服务**。

> **为什么叫 Huli？** 狐狸在东方文化中象征着机智、敏捷和灵性。我们希望这款工具能像狐狸一样，敏锐地嗅出设备中的每一丝威胁，灵动地应对每一种风险，为你的 Android 之旅保驾护航 🦊

---

## 🎯 三模检测体系

Huli 支持三种检测模式，根据你的设备状态自动适配，**不需要全部开启，按需选择即可**：

| 检测模式 | 权限要求 | 检测深度 | 说明 |
|---------|---------|---------|------|
| 🟢 **基础模式** | 无需 Root | ⭐⭐ | 普通应用扫描、云端哈希检测、权限审计 |
| 🔵 **Shizuku 模式** | Shizuku 授权 | ⭐⭐⭐ | ADB 级权限深度检测、系统服务扫描、应用ops审计 |
| 🟠 **Root 模式** | Magisk / KernelSU / APatch | ⭐⭐⭐⭐⭐ | 系统分区校验、进程注入检测、模块安全审计、全维度扫描 |
| 🟣 **LSPosed 模式** | LSPosed 框架 | ⭐⭐⭐⭐ | 模块行为监控、Hook 行为检测、作用域安全审计 |

> 💡 **所有高级检测模式（Root / Shizuku）**均为**可选**，仅在你主动开启并授权后才会触发相关检测。未授权时自动降级到基础模式，UI体验完全一致。

---

## ✨ 核心功能

<div style="display: flex; gap: 20px; flex-wrap: wrap; justify-content: center; margin: 28px 0;">

<div style="flex: 1; min-width: 280px; max-width: 340px; background: linear-gradient(135deg, #ff5858 0%, #f09819 100%); padding: 28px; border-radius: 24px; box-shadow: 0 10px 40px rgba(255, 88, 88, 0.4);">
  <div style="font-size: 48px; margin-bottom: 12px;">🦠</div>
  <h3 style="margin: 0 0 10px 0; color: #fff;">云端病毒查杀</h3>
  <p style="margin: 0; color: rgba(255,255,255,0.85); font-size: 14px; line-height: 1.6;">接入 VirusTotal 等 70+ 云端引擎，木马、勒索、间谍、广告、挖矿程序一网打尽。支持 APK 全量扫描与安装包实时监控，新安装应用自动检测。</p>
</div>

<div style="flex: 1; min-width: 280px; max-width: 340px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 28px; border-radius: 24px; box-shadow: 0 10px 40px rgba(102, 126, 234, 0.4);">
  <div style="font-size: 48px; margin-bottom: 12px;">🎮</div>
  <h3 style="margin: 0 0 10px 0; color: #fff;">远控后门扫描</h3>
  <p style="margin: 0; color: rgba(255,255,255,0.85); font-size: 14px; line-height: 1.6;">检测 TeamViewer、向日葵、ToDesk、AnyDesk 等远控软件，以及 AhMyth、AndroRat、SpyNote 等开源 RAT 工具。扫描异常端口、后台服务、网络连接，发现潜伏后门立即切断。</p>
</div>

<div style="flex: 1; min-width: 280px; max-width: 340px; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); padding: 28px; border-radius: 24px; box-shadow: 0 10px 40px rgba(245, 87, 108, 0.4);">
  <div style="font-size: 48px; margin-bottom: 12px;">🧩</div>
  <h3 style="margin: 0 0 10px 0; color: #fff;">模块安全审计</h3>
  <p style="margin: 0; color: rgba(255,255,255,0.85); font-size: 14px; line-height: 1.6;">深度扫描所有已安装的 Magisk / KernelSU / LSPosed 模块。检测模块脚本中的恶意命令、系统文件替换、开机自启可疑操作。每个模块都经过安全评级，危险模块立即标记警告。</p>
</div>

<div style="flex: 1; min-width: 280px; max-width: 340px; background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); padding: 28px; border-radius: 24px; box-shadow: 0 10px 40px rgba(79, 172, 254, 0.4);">
  <div style="font-size: 48px; margin-bottom: 12px;">💉</div>
  <h3 style="margin: 0 0 10px 0; color: #fff;">木马植入检测</h3>
  <p style="margin: 0; color: rgba(255,255,255,0.85); font-size: 14px; line-height: 1.6;">扫描系统服务、Zygote 进程、应用进程是否被注入木马代码。检查 dex 文件、so 库、odex 缓存是否被 patch 或 hook。从应用层到框架层再到 Native 层，全方位排查植入威胁。</p>
</div>

<div style="flex: 1; min-width: 280px; max-width: 340px; background: linear-gradient(135deg, #fa709a 0%, #fee140 100%); padding: 28px; border-radius: 24px; box-shadow: 0 10px 40px rgba(250, 112, 154, 0.4);">
  <div style="font-size: 48px; margin-bottom: 12px;">📤</div>
  <h3 style="margin: 0 0 10px 0; color: #fff;">恶意上传监控</h3>
  <p style="margin: 0; color: rgba(255,255,255,0.85); font-size: 14px; line-height: 1.6;">实时监控应用网络行为，检测是否有应用在后台偷偷上传照片、视频、通讯录、短信、文件。通过流量大小、上传频率、目标域名多维度判断，可疑上传立即弹窗警告。</p>
</div>

<div style="flex: 1; min-width: 280px; max-width: 340px; background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%); padding: 28px; border-radius: 24px; box-shadow: 0 10px 40px rgba(168, 237, 234, 0.4);">
  <div style="font-size: 48px; margin-bottom: 12px;">💣</div>
  <h3 style="margin: 0 0 10px 0; color: #333;">系统完整性校验</h3>
  <p style="margin: 0; color: rgba(0,0,0,0.7); font-size: 14px; line-height: 1.6;">检测 /system、/vendor、/product 分区系统模块是否被篡改、替换或注入恶意代码。校验系统文件哈希值，与原厂 ROM 比对，发现不一致立即报警。通过 Root 模式可深入 Boot 分区级检测。</p>
</div>

<div style="flex: 1; min-width: 280px; max-width: 340px; background: linear-gradient(135deg, #84fab0 0%, #8fd3f4 100%); padding: 28px; border-radius: 24px; box-shadow: 0 10px 40px rgba(132, 250, 176, 0.4);">
  <div style="font-size: 48px; margin-bottom: 12px;">🔑</div>
  <h3 style="margin: 0 0 10px 0; color: #333;">密码安全检测</h3>
  <p style="margin: 0; color: rgba(0,0,0,0.7); font-size: 14px; line-height: 1.6;">扫描设备已保存密码，检测弱密码（123456、password）、重复密码（多账号共用）、泄露密码（对接 Have I Been Pwned 数据库）。使用 k-匿名性技术，密码哈希只发前5位，保护隐私。</p>
</div>

<div style="flex: 1; min-width: 280px; max-width: 340px; background: linear-gradient(135deg, #654ea3 0%, #eaafc8 100%); padding: 28px; border-radius: 24px; box-shadow: 0 10px 40px rgba(101, 78, 163, 0.4);">
  <div style="font-size: 48px; margin-bottom: 12px;">🔌</div>
  <h3 style="margin: 0 0 10px 0; color: #fff;">Shizuku 授权支持</h3>
  <p style="margin: 0; color: rgba(255,255,255,0.85); font-size: 14px; line-height: 1.6;">通过 Shizuku 获取 ADB 级权限进行深度检测，无需 Root 也能达到系统级扫描能力。可进行应用 ops 权限审计、系统服务状态检测、应用间通信监控。用户主动触发授权，用完即回收。</p>
</div>

<div style="flex: 1; min-width: 280px; max-width: 340px; background: linear-gradient(135deg, #0c3483 0%, #a2b6df 100%); padding: 28px; border-radius: 24px; box-shadow: 0 10px 40px rgba(12, 52, 131, 0.4);">
  <div style="font-size: 48px; margin-bottom: 12px;">🛡️</div>
  <h3 style="margin: 0 0 10px 0; color: #fff;">隐私保护监控</h3>
  <p style="margin: 0; color: rgba(255,255,255,0.85); font-size: 14px; line-height: 1.6;">实时监控摄像头、麦克风、剪贴板调用。谁在后台偷拍、偷录、偷读你的验证码？一目了然。敏感权限一键撤回，应用行为全程记录。你的隐私只属于你自己。</p>
</div>

</div>

---

## 🔍 为什么选择 Huli？

| 特性 | Huli | 传统安全软件 |
|------|------|-------------|
| **云端多引擎扫描** | ✅ 70+ 引擎联合检测 | ❌ 单一引擎，检出率低 |
| **Root 深度检测** | ✅ 系统级完整性校验 + 植入检测 | ❌ 无 Root 或仅基础扫描 |
| **LSPosed 模块审计** | ✅ 模块脚本安全扫描 + 行为监控 | ❌ 完全不支持 |
| **Shizuku ADB 级检测** | ✅ 无需 Root 也能深度扫描 | ❌ 完全不支持 |
| **远控后门扫描** | ✅ 10+ 种远控工具识别 | ❌ 功能缺失 |
| **木马植入检测** | ✅ dex/so 注入 + 进程 hook 检测 | ❌ 仅签名比对 |
| **模块安全审计** | ✅ Magisk/KernelSU/LSPosed 全覆盖 | ❌ 完全不支持 |
| **密码泄露检测** | ✅ 弱密码 + 泄露密码比对 | ❌ 功能缺失 |
| **恶意上传监控** | ✅ 实时流量分析 + 可疑上传告警 | ❌ 功能缺失或付费 |
| **系统完整性校验** | ✅ 原厂 ROM 哈希比对 | ❌ 功能缺失 |
| **无广告 / 无后台偷跑** | ✅ 纯本地运行，开源透明 | ❌ 你懂的 |

---

## 🛡️ 云端安全检测引擎

Huli 接入全球顶级云端安全扫描服务，提供企业级安全防护能力：

### 🌐 接入的云端扫描服务

| 服务 | 说明 | 官网 |
|------|------|------|
| **VirusTotal** | 全球最权威多引擎扫描平台，70+ 杀毒引擎（卡巴斯基、Avast、Bitdefender 等） | [virustotal.com](https://www.virustotal.com) |
| **Hybrid Analysis** | CrowdStrike 旗下免费沙箱，动态行为分析，隔离环境观察应用真实行为 | [hybrid-analysis.com](https://www.hybrid-analysis.com) |
| **MetaDefender Cloud** | OPSWAT 多引擎威胁情报平台，文件哈希、域名/IP 信誉、CDR 高级功能 | [metadefender.opswat.com](https://metadefender.opswat.com) |
| **Kaspersky Threat Intelligence** | 卡巴斯基官方威胁情报，文件、域名、IP、URL 安全检测 | [opentip.kaspersky.com](https://opentip.kaspersky.com) |
| **urlscan.io** | 专业 URL/网站安全扫描，页面截图、流量分析、400+ 品牌钓鱼检测 | [urlscan.io](https://urlscan.io) |
| **Google Safe Browsing** | 谷歌安全浏览透明报告，Chrome/Firefox 内置安全数据源 | [transparencyreport.google.com](https://transparencyreport.google.com/safe-browsing/search) |

> 💡 **隐私保护**：我们只上传应用的哈希值（指纹），**不上传完整 APK 文件。匿名检测，不需要注册账号，所有检测逻辑完全开源。

---

## 🦠 可检测的威胁类型

### 🔴 恶意软件类

- **木马程序检测** — 识别隐藏在正常应用中的木马、后门。伪装成「实用工具」「游戏辅助」的恶意 App 无所遁形
- **勒索软件检测** — 扫描文件加密行为，照片文档被加密勒索前提前发现清除
- **间谍软件检测** — 发现窃取短信、通话记录、位置的恶意程序，你的隐私不该是商品
- **广告软件检测** — 识别植入恶意广告 SDK 的应用，后台弹广告偷流量 App 一次性清理
- **挖矿程序检测** — 检测后台加密货币挖矿程序，手机性能不该给别人挖矿
- **银行木马检测** — 金融类 App 专项识别，支付安全重中之重
- **Rootkit 检测** — 深度隐藏 Rootkit/Bootkit 扫描，系统底层揪出潜伏威胁
- **钓鱼网站检测** — Google Safe Browsing + urlscan.io 实时检测恶意网址

### 🟠 系统安全类

- **系统模块完整性校验** — 检测 /system、/vendor、/product 分区是否被篡改注入
- **木马植入检测** — dex/so/odex 注入扫描，Zygote/系统服务/应用进程全排查
- **模块安全审计** — Magisk/KernelSU/LSPosed 模块脚本审计，恶意命令/文件替换检测

### 🟡 网络安全类

- **远控后门扫描** — TeamViewer/向日葵/ToDesk/AnyDesk + AhMyth/AndroRat/SpyNote 全识别
- **恶意上传监控** — 照片/视频/通讯录/短信/文件上传行为实时监控
- **可疑域名拦截** — 恶意软件/钓鱼/C&C 服务器域名 IP 自动拦截

### 🔵 隐私安全类

- **密码安全检测** — 弱密码/重复密码/泄露密码（Have I Been Pwned）检测
- **摄像头/麦克风调用检测** — 后台偷拍偷录实时闪烁警告
- **剪贴板读取监控** — 身份证/银行卡/验证码不该被无关应用看到
- **敏感文件扫描** — 身份证/银行卡/私密照片存放位置安全检测

---

## 🎯 系统要求

| 项目 | 最低要求 | 推荐配置 |
|------|----------|----------|
| **Android 版本** | 7.0 (API 24) | 12.0+ (最佳视觉效果) |
| **Root 权限** | 可选（Magisk / KernelSU / APatch） | 最新稳定版 |
| **Shizuku** | 可选（v12+） | 最新版 |
| **LSPosed** | 可选（Zygisk / Riru） | 最新版 |
| **存储空间** | 30MB | 100MB+ |
| **架构** | arm64-v8a | arm64-v8a + 原生中文 |
| **RAM** | 2GB | 4GB+ |

> 💡 **Root / Shizuku 均为可选项。没有 Root 或不想 Root 的用户可以使用基础模式，或通过 Shizuku 获得 ADB 级深度检测能力。

---

## 🗺️ 开发路线图

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                            Huli 开发路线图                                    │
├──────────┬────────────────────────────────────────────────────┬─────────────┤
│  v0.1.0  │  项目框架搭建 + 主题系统 + 液态玻璃视觉           │  ✅ 已完成   │
│  v0.2.0  │  云端病毒扫描接入 + 应用扫描 + 权限审计            │  🔥 开发中   │
│  v0.3.0  │  Root 深度检测 + 系统模块校验 + 木马植入检测       │  📋 规划中   │
│  v0.4.0  │  Shizuku 模式 + ADB 级深度检测                   │  📋 规划中   │
│  v0.5.0  │  LSPosed 模块审计 + Hook 行为检测                │  📋 规划中   │
│  v0.6.0  │  远控后门扫描 + 恶意上传监控 + 网络威胁拦截       │  📋 规划中   │
│  v0.7.0  │  密码安全检测 + 敏感文件扫描 + 隐私监控           │  📋 规划中   │
│  v0.8.0  │  全面安全体检 + 可视化报告 + 一键修复              │  📋 规划中   │
│  v1.0.0  │  正式版发布 🎉 完整功能 + 稳定体验                │  🌟 未来     │
└──────────┴────────────────────────────────────────────────────┴─────────────┘
```

---

## 🤔 常见问题 FAQ

### Q: Huli 必须 Root 才能用吗？
A: **不需要。** Huli 支持三种检测模式：
- **基础模式**：无需任何权限，可进行应用扫描、云端哈希检测
- **Shizuku 模式**：通过 Shizuku 授权获得 ADB 级权限进行深度检测
- **Root 模式**：通过 Magisk/KernelSU/APatch 获得系统级最高检测能力

所有高级模式均为**用户主动触发**，不会后台静默请求权限。

### Q: Shizuku 是什么？安全吗？
A: Shizuku 是一个通过 Android 系统服务管理工具，可以让普通应用获得 ADB（Android Debug Bridge）级别的权限。相比 Root，Shizuku 的权限更可控，用完即可回收。Huli 仅在你点击「开启 Shizuku 检测」时才会请求授权，检测完毕后权限立即失效。

### Q: 病毒检测需要联网吗？
A: 云端扫描需要联网查询 VirusTotal 等服务，但我们**只上传应用哈希值（指纹）**，不会上传完整 APK。你也可以在设置中关闭云端扫描，使用纯本地特征库模式。

### Q: 会有 iOS 版本吗？
A: 短期内不会。Huli 专注于 Android 平台的深度安全检测。

### Q: 项目开源吗？
A: 是的！Huli 完全开源，代码托管在 GitHub。欢迎 Star、Fork、提交 PR。

---

## 💖 赞助支持

> **这个项目由我个人在业余时间独立开发。从架构设计到 UI 打磨，从功能开发到测试适配，每一个细节都倾注了大量心血。如果你觉得它对你有帮助，欢迎通过以下方式赞助我！**

<div style="display: flex; gap: 24px; flex-wrap: wrap; justify-content: center; margin: 36px 0;">

<div style="width: 280px; border-radius: 24px; padding: 28px 22px; text-align: center; backdrop-filter: blur(24px); -webkit-backdrop-filter: blur(24px); border: 1px solid rgba(22, 119, 255, 0.35); background: linear-gradient(160deg, rgba(22, 119, 255, 0.18), rgba(22, 119, 255, 0.04)); box-shadow: 0 12px 40px rgba(22, 119, 255, 0.25), inset 0 1px 0 rgba(255, 255, 255, 0.25);">
  <div style="width: 60px; height: 60px; margin: 0 auto 14px; border-radius: 18px; background: linear-gradient(135deg, #1677ff, #0958d9); display: flex; align-items: center; justify-content: center; color: #fff; font-size: 30px; font-weight: bold; box-shadow: 0 6px 20px rgba(22, 119, 255, 0.4);">支</div>
  <h3 style="margin: 0 0 6px 0; color: #1677ff; font-size: 20px;">支付宝</h3>
  <p style="margin: 0 0 18px 0; font-size: 13px; color: #999;">推荐使用 · 支持花呗 / 信用卡</p>
  <a href="assets/alipay.png" target="_blank" style="text-decoration: none;">
  <div style="background: #fff; border-radius: 16px; padding: 10px; margin: 0 auto 14px; width: 100%; max-width: 180px; aspect-ratio: 1 / 1; box-shadow: 0 6px 24px rgba(0, 0, 0, 0.12); cursor: pointer; transition: transform 0.2s;">
    <img src="assets/alipay.png" alt="支付宝收款码（点击放大）" style="width: 100%; height: 100%; object-fit: contain; border-radius: 10px;" />
  </div>
  </a>
  <p style="margin: 0; font-size: 13px; color: #888;">👆 点击图片查看大图</p>
  <p style="margin: 8px 0 0 0; font-size: 14px; color: #333; font-weight: 600;">狐狸科技</p>
</div>

<div style="width: 280px; border-radius: 24px; padding: 28px 22px; text-align: center; backdrop-filter: blur(24px); -webkit-backdrop-filter: blur(24px); border: 1px solid rgba(7, 193, 96, 0.35); background: linear-gradient(160deg, rgba(7, 193, 96, 0.18), rgba(7, 193, 96, 0.04)); box-shadow: 0 12px 40px rgba(7, 193, 96, 0.25), inset 0 1px 0 rgba(255, 255, 255, 0.25);">
  <div style="width: 60px; height: 60px; margin: 0 auto 14px; border-radius: 18px; background: linear-gradient(135deg, #07c160, #06ad56); display: flex; align-items: center; justify-content: center; color: #fff; font-size: 30px; font-weight: bold; box-shadow: 0 6px 20px rgba(7, 193, 96, 0.4);">微</div>
  <h3 style="margin: 0 0 6px 0; color: #07c160; font-size: 20px;">微信支付</h3>
  <p style="margin: 0 0 18px 0; font-size: 13px; color: #999;">微信扫码，方便快捷</p>
  <a href="assets/wechat.png" target="_blank" style="text-decoration: none;">
  <div style="background: #fff; border-radius: 16px; padding: 10px; margin: 0 auto 14px; width: 100%; max-width: 180px; aspect-ratio: 1 / 1; box-shadow: 0 6px 24px rgba(0, 0, 0, 0.12); cursor: pointer;">
    <img src="assets/wechat.png" alt="微信收款码（点击放大）" style="width: 100%; height: 100%; object-fit: contain; border-radius: 10px;" />
  </div>
  </a>
  <p style="margin: 0; font-size: 13px; color: #888;">👆 点击图片查看大图</p>
  <p style="margin: 8px 0 0 0; font-size: 14px; color: #333; font-weight: 600;">狐狸</p>
</div>

<div style="width: 280px; border-radius: 24px; padding: 28px 22px; text-align: center; backdrop-filter: blur(24px); -webkit-backdrop-filter: blur(24px); border: 1px solid rgba(168, 85, 247, 0.35); background: linear-gradient(160deg, rgba(168, 85, 247, 0.18), rgba(168, 85, 247, 0.04)); box-shadow: 0 12px 40px rgba(168, 85, 247, 0.25), inset 0 1px 0 rgba(255, 255, 255, 0.25);">
  <div style="width: 60px; height: 60px; margin: 0 auto 14px; border-radius: 18px; background: linear-gradient(135deg, #a855f7, #9333ea); display: flex; align-items: center; justify-content: center; font-size: 30px; box-shadow: 0 6px 20px rgba(168, 85, 247, 0.4);">💖</div>
  <h3 style="margin: 0 0 6px 0; color: #a855f7; font-size: 20px;">爱发电</h3>
  <p style="margin: 0 0 18px 0; font-size: 13px; color: #999;">长期赞助 · 解锁更多权益</p>
  <a href="assets/afdian.png" target="_blank" style="text-decoration: none;">
  <div style="background: #fff; border-radius: 16px; padding: 10px; margin: 0 auto 14px; width: 100%; max-width: 180px; aspect-ratio: 1 / 1; box-shadow: 0 6px 24px rgba(0, 0, 0, 0.12); cursor: pointer;">
    <img src="assets/afdian.png" alt="爱发电主页码（点击放大）" style="width: 100%; height: 100%; object-fit: contain; border-radius: 10px;" />
  </div>
  </a>
  <p style="margin: 0; font-size: 13px; color: #888;">👆 点击图片查看大图</p>
  <a href="https://www.ifdian.net/a/hulihulihuli" target="_blank" style="display: inline-block; margin-top: 12px; padding: 10px 24px; background: linear-gradient(135deg, #a855f7, #9333ea); color: #fff; border-radius: 12px; text-decoration: none; font-size: 14px; font-weight: 600; box-shadow: 0 4px 16px rgba(168, 85, 247, 0.4);">👉 前往爱发电主页</a>
</div>

</div>

<p align="center" style="color: #888; font-size: 14px; margin-top: 12px;">
  💡 扫码后请备注你的昵称，感谢你的支持 ❤️
</p>

---

<p align="center">
  <a href="https://www.ifdian.net/a/hulihulihuli"><img src="https://img.shields.io/badge/💖_爱发电-hulihulihuli-ff69b4?style=flat-square" /></a>
</p>

<p align="center">
  <i>Made with 🔥 and ❤️ by 搞机爱好者，为搞机爱好者</i>
</p>

<p align="center">
  <i>🦊 Huli — 让每一位 Android 用户都能安心使用自己的设备</i>
</p>
