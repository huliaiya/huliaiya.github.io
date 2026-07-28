<p align="center">
  <img src="assets/logo.png" alt="Huli Logo" style="width: 120px; height: 120px; border-radius: 50%; object-fit: cover; box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3); border: 4px solid #fff; user-select: none; -webkit-user-select: none; -webkit-user-drag: none; -webkit-touch-callout: none;" draggable="false" />
</p>

<h1 align="center">🦊 Huli</h1>

<p align="center">
  <b>Android 病毒检测 & 安全防护工具</b>
</p>

<p align="center">
  <i>云端多引擎检测 · Root/LSPosed/Shizuku 多模式支持 · 了解你的设备安全状态</i>
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

**Huli（狐狸）是一款专为 Android 设备打造的病毒检测与安全防护工具，帮助你了解和管理设备的安全状态。**

你是否关心过这些安全问题？

| 关注场景 | 你想了解吗？ |
|---------|-------------|
| 🦠 **木马病毒** | 手机里有没有可疑的木马、勒索类应用？ |
| 🕵️ **间谍软件** | 有没有应用在频繁读取短信、通话记录、位置信息？ |
| 🎮 **远控后门** | 设备上有没有安装可疑的远控软件或 RAT 工具？ |
| 📤 **恶意上传** | 有没有应用在后台上传大量数据？ |
| 🧩 **模块注入** | Magisk / LSPosed 模块有没有包含可疑的脚本？ |
| 🔑 **密码泄露** | 你保存的密码是不是太弱或在泄露事件中出现过？ |
| 📡 **隐私窥探** | 有没有应用在后台频繁调用摄像头、麦克风、剪贴板？ |
| 💣 **系统篡改** | 系统分区文件有没有被修改过？ |
| 🔥 **异常发热** | 手机发烫、耗电快时，是哪个应用在后台跑？ |

**Huli 希望通过多种检测方式，帮你更好地了解设备的安全状况。**

我们接入了 **VirusTotal、Hybrid Analysis、MetaDefender** 等云端扫描服务（可调用 70+ 杀毒引擎的检测结果），配合 **Root / LSPosed / Shizuku** 三种检测模式，为你的 Android 设备提供多维度的安全检测。

> **为什么叫 Huli？** 狐狸在东方文化中象征着机警和敏锐。我们希望这款工具能像狐狸一样，帮助你及时发现设备中的安全问题 🦊

---

## 🎯 多种检测模式

Huli 支持多种检测模式，你可以根据设备状态选择适合的方式：

| 检测模式 | 权限要求 | 检测范围 | 说明 |
|---------|---------|---------|------|
| 🟢 **基础模式** | 无需 Root | 应用扫描、云端哈希检测、权限审计 | 所有设备都可用 |
| 🔵 **Shizuku 模式** | Shizuku 授权 | ADB 级检测、系统服务查看、应用 ops 检查 | 无需 Root，检测范围更广 |
| 🟠 **Root 模式** | Magisk / KernelSU / APatch | 系统分区检查、进程检测、模块审计 | 检测最全面 |
| 🟣 **LSPosed 模式** | LSPosed 框架 | 模块行为监控、Hook 检测、作用域检查 | 需配合 LSPosed 使用 |

> 💡 所有高级检测模式（Root / Shizuku）均为可选，仅在你主动开启并授权后才会触发。未授权时自动使用基础模式。

---

## ✨ 核心功能

<div style="display: flex; gap: 20px; flex-wrap: wrap; justify-content: center; margin: 28px 0;">

<div style="flex: 1; min-width: 280px; max-width: 340px; background: linear-gradient(135deg, #ff5858 0%, #f09819 100%); padding: 28px; border-radius: 24px; box-shadow: 0 10px 40px rgba(255, 88, 88, 0.4);">
  <div style="font-size: 48px; margin-bottom: 12px;">🦠</div>
  <h3 style="margin: 0 0 10px 0; color: #fff;">云端病毒检测</h3>
  <p style="margin: 0; color: rgba(255,255,255,0.85); font-size: 14px; line-height: 1.6;">接入 VirusTotal 等云端服务，可查询 70+ 引擎的检测结果，帮助识别木马、勒索、间谍等可疑应用。支持 APK 批量扫描和新安装应用检测。</p>
</div>

<div style="flex: 1; min-width: 280px; max-width: 340px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 28px; border-radius: 24px; box-shadow: 0 10px 40px rgba(102, 126, 234, 0.4);">
  <div style="font-size: 48px; margin-bottom: 12px;">🎮</div>
  <h3 style="margin: 0 0 10px 0; color: #fff;">远控后门扫描</h3>
  <p style="margin: 0; color: rgba(255,255,255,0.85); font-size: 14px; line-height: 1.6;">检测 TeamViewer、向日葵、ToDesk、AnyDesk 等常见远控软件，以及 AhMyth、AndroRat、SpyNote 等开源 RAT 工具特征。扫描异常端口、后台服务和网络连接，帮助发现可疑的远控行为。</p>
</div>

<div style="flex: 1; min-width: 280px; max-width: 340px; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); padding: 28px; border-radius: 24px; box-shadow: 0 10px 40px rgba(245, 87, 108, 0.4);">
  <div style="font-size: 48px; margin-bottom: 12px;">🧩</div>
  <h3 style="margin: 0 0 10px 0; color: #fff;">模块安全审计</h3>
  <p style="margin: 0; color: rgba(255,255,255,0.85); font-size: 14px; line-height: 1.6;">扫描已安装的 Magisk / KernelSU / LSPosed 模块，检查模块脚本中是否包含可疑命令、是否修改了系统文件、是否在开机时执行了额外操作。对模块进行安全评级标注。</p>
</div>

<div style="flex: 1; min-width: 280px; max-width: 340px; background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); padding: 28px; border-radius: 24px; box-shadow: 0 10px 40px rgba(79, 172, 254, 0.4);">
  <div style="font-size: 48px; margin-bottom: 12px;">💉</div>
  <h3 style="margin: 0 0 10px 0; color: #fff;">注入行为检测</h3>
  <p style="margin: 0; color: rgba(255,255,255,0.85); font-size: 14px; line-height: 1.6;">扫描系统服务、Zygote 进程、应用进程中是否存在可疑的注入行为。检查 dex 文件、so 库是否被修改，从应用层到框架层多维度排查。</p>
</div>

<div style="flex: 1; min-width: 280px; max-width: 340px; background: linear-gradient(135deg, #fa709a 0%, #fee140 100%); padding: 28px; border-radius: 24px; box-shadow: 0 10px 40px rgba(250, 112, 154, 0.4);">
  <div style="font-size: 48px; margin-bottom: 12px;">📤</div>
  <h3 style="margin: 0 0 10px 0; color: #fff;">网络行为监控</h3>
  <p style="margin: 0; color: rgba(255,255,255,0.85); font-size: 14px; line-height: 1.6;">观察应用的网络行为，统计各应用的流量使用情况。对上传频率异常、流量消耗大的应用进行标注，帮助你了解哪些应用在后台活跃。</p>
</div>

<div style="flex: 1; min-width: 280px; max-width: 340px; background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%); padding: 28px; border-radius: 24px; box-shadow: 0 10px 40px rgba(168, 237, 234, 0.4);">
  <div style="font-size: 48px; margin-bottom: 12px;">💣</div>
  <h3 style="margin: 0 0 10px 0; color: #333;">系统完整性校验</h3>
  <p style="margin: 0; color: rgba(0,0,0,0.7); font-size: 14px; line-height: 1.6;">检查 /system、/vendor、/product 分区的系统文件状态，与基准哈希值进行比对。发现与预期不一致的文件会进行标注，帮助你了解系统分区的变动情况。</p>
</div>

<div style="flex: 1; min-width: 280px; max-width: 340px; background: linear-gradient(135deg, #84fab0 0%, #8fd3f4 100%); padding: 28px; border-radius: 24px; box-shadow: 0 10px 40px rgba(132, 250, 176, 0.4);">
  <div style="font-size: 48px; margin-bottom: 12px;">🔑</div>
  <h3 style="margin: 0 0 10px 0; color: #333;">密码安全检测</h3>
  <p style="margin: 0; color: rgba(0,0,0,0.7); font-size: 14px; line-height: 1.6;">检查设备中已保存的密码强度，识别弱密码和重复使用的密码。可对接 Have I Been Pwned 查询密码是否在已知泄露事件中出现过（使用 k-匿名性技术保护隐私）。</p>
</div>

<div style="flex: 1; min-width: 280px; max-width: 340px; background: linear-gradient(135deg, #654ea3 0%, #eaafc8 100%); padding: 28px; border-radius: 24px; box-shadow: 0 10px 40px rgba(101, 78, 163, 0.4);">
  <div style="font-size: 48px; margin-bottom: 12px;">🔌</div>
  <h3 style="margin: 0 0 10px 0; color: #fff;">Shizuku 授权支持</h3>
  <p style="margin: 0; color: rgba(255,255,255,0.85); font-size: 14px; line-height: 1.6;">支持通过 Shizuku 获取 ADB 级权限进行更深入的检测，无需 Root 也能达到更高的检测能力。可进行应用 ops 权限查看、系统服务状态检查等。由用户主动触发授权，检测结束后权限失效。</p>
</div>

<div style="flex: 1; min-width: 280px; max-width: 340px; background: linear-gradient(135deg, #0c3483 0%, #a2b6df 100%); padding: 28px; border-radius: 24px; box-shadow: 0 10px 40px rgba(12, 52, 131, 0.4);">
  <div style="font-size: 48px; margin-bottom: 12px;">🛡️</div>
  <h3 style="margin: 0 0 10px 0; color: #fff;">隐私保护监控</h3>
  <p style="margin: 0; color: rgba(255,255,255,0.85); font-size: 14px; line-height: 1.6;">记录摄像头、麦克风、剪贴板的调用情况，方便你查看哪些应用使用了这些敏感权限。支持对应用的敏感权限进行管理和撤回。</p>
</div>

<div style="flex: 1; min-width: 280px; max-width: 340px; background: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 100%); padding: 28px; border-radius: 24px; box-shadow: 0 10px 40px rgba(255, 154, 158, 0.4);">
  <div style="font-size: 48px; margin-bottom: 12px;">🔥</div>
  <h3 style="margin: 0 0 10px 0; color: #333;">设备异常发热检测</h3>
  <p style="margin: 0; color: rgba(0,0,0,0.7); font-size: 14px; line-height: 1.6;">监控设备温度和 CPU/GPU 占用情况，记录各应用的资源消耗。当设备温度过高或耗电异常时，帮助你定位是哪个应用在后台频繁活动。</p>
</div>

</div>

---

## 🔍 功能对比

| 特性 | Huli | 其他工具 |
|------|------|---------|
| **云端多引擎查询** | ✅ 可查询 70+ 引擎检测结果 | 多数为单一引擎 |
| **Root 检测支持** | ✅ 支持系统级检查 | 多数不支持或仅基础功能 |
| **LSPosed 支持** | ✅ 模块内容检查 | 不支持 |
| **Shizuku 支持** | ✅ 无需 Root 的 ADB 级检测 | 不支持 |
| **远控软件识别** | ✅ 常见远控及 RAT 特征识别 | 功能缺失 |
| **注入行为检测** | ✅ dex/so 文件修改检查 | 多数仅签名比对 |
| **模块安全检查** | ✅ Magisk/KernelSU/LSPosed 支持 | 不支持 |
| **密码安全检查** | ✅ 弱密码/泄露密码检测 | 功能缺失 |
| **流量统计** | ✅ 应用流量使用情况统计 | 功能缺失或需付费 |
| **系统文件检查** | ✅ 分区文件变动检查 | 功能缺失 |
| **设备发热监测** | ✅ 温度/CPU/GPU 占用监测 | 功能缺失或仅基础省电 |
| **无广告 / 开源** | ✅ 纯本地运行，代码开源 | 多数有广告或闭源 |

---

## 🛡️ 云端扫描服务

Huli 接入了多个云端安全扫描服务，可帮助你获得更全面的检测结果：

### 🌐 支持的云端服务

| 服务 | 说明 | 官网 |
|------|------|------|
| **VirusTotal** | 多引擎扫描平台，可查询 70+ 杀毒引擎的检测结果 | [virustotal.com](https://www.virustotal.com) |
| **Hybrid Analysis** | 沙箱分析服务，可观察应用的动态行为 | [hybrid-analysis.com](https://www.hybrid-analysis.com) |
| **MetaDefender Cloud** | 多引擎威胁情报平台，支持哈希、域名、IP 查询 | [metadefender.opswat.com](https://metadefender.opswat.com) |
| **Kaspersky Threat Intelligence** | 卡巴斯基威胁情报，支持文件、域名、IP、URL 查询 | [opentip.kaspersky.com](https://opentip.kaspersky.com) |
| **urlscan.io** | URL/网站安全扫描服务 | [urlscan.io](https://urlscan.io) |
| **Google Safe Browsing** | 谷歌安全浏览透明报告 | [transparencyreport.google.com](https://transparencyreport.google.com/safe-browsing/search) |

> 💡 **隐私说明**：我们只上传应用的哈希值，不上传完整 APK 文件。不需要注册账号。

---

## 🦠 支持的检测类型

### 🔴 应用安全类

- **木马程序检测** — 通过云端多引擎结果比对，帮助识别可疑的木马、后门类应用
- **勒索软件检测** — 扫描具有文件加密行为特征的应用
- **间谍软件检测** — 发现有频繁读取短信、通话记录、位置等行为的应用
- **广告软件检测** — 识别植入可疑广告 SDK 的应用
- **挖矿程序检测** — 检测后台运行加密货币挖矿行为的应用
- **银行木马检测** — 针对金融类应用的专项检测
- **Rootkit 检测** — 扫描深度隐藏的可疑程序
- **钓鱼网站检测** — 接入 Google Safe Browsing 和 urlscan.io 查询恶意网址

### 🟠 系统安全类

- **系统模块完整性校验** — 检查 /system、/vendor、/product 分区文件是否有变动
- **注入行为检测** — 扫描 dex/so 文件及进程中是否存在可疑的修改
- **模块安全审计** — 检查 Magisk/KernelSU/LSPosed 模块脚本内容

### 🟡 网络行为类

- **远控软件检测** — 识别常见远控软件及开源 RAT 工具特征
- **流量行为观察** — 统计各应用的上传下载流量情况
- **可疑域名标注** — 对接威胁情报库标注高风险域名

### 🔵 隐私安全类

- **密码安全检查** — 弱密码/重复密码/泄露密码检测
- **摄像头/麦克风调用记录** — 记录应用对敏感硬件的调用
- **剪贴板读取监控** — 记录应用读取剪贴板的行为
- **敏感文件扫描** — 检查敏感文件的存储位置是否安全

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
┌─────────────────────────────────────────────────────────────────────┐
│                          Huli 开发路线图                              │
├──────────┬──────────────────────────────────────────┬─────────────┤
│  v0.1.0  │  项目框架搭建 + 主题系统                  │  ✅ 已完成   │
│  v0.2.0  │  云端扫描接入 + 应用扫描 + 权限审计       │  🔥 开发中   │
│  v0.3.0  │  Root 模式 + 系统文件检查                 │  📋 规划中   │
│  v0.4.0  │  Shizuku 模式支持                         │  📋 规划中   │
│  v0.5.0  │  LSPosed 模块检查                         │  📋 规划中   │
│  v0.6.0  │  远控软件识别 + 流量统计                  │  📋 规划中   │
│  v0.7.0  │  密码安全检查 + 隐私监控                  │  📋 规划中   │
│  v0.8.0  │  设备温度/资源占用监测                    │  📋 规划中   │
│  v0.9.0  │  综合检测报告 + 一键处理                  │  📋 规划中   │
│  v1.0.0  │  正式版发布                                │  🌟 未来     │
└──────────┴──────────────────────────────────────────┴─────────────┘
```

---

## 🤔 常见问题 FAQ

### Q: Huli 必须 Root 才能用吗？
A: 不需要。Huli 支持多种检测模式：
- **基础模式**：无需任何权限，可进行应用扫描、云端哈希查询
- **Shizuku 模式**：通过 Shizuku 授权获得 ADB 级权限进行更深入检测
- **Root 模式**：通过 Magisk/KernelSU/APatch 获得最全面的检测能力

所有高级模式均需用户主动触发，不会后台请求权限。

### Q: Shizuku 是什么？安全吗？
A: Shizuku 是一个工具，可以让普通应用获得 ADB（Android Debug Bridge）级别的权限。相比 Root，Shizuku 的权限范围更可控。Huli 仅在你手动点击相关功能时才会请求 Shizuku 授权。

### Q: 病毒检测需要联网吗？
A: 云端扫描需要联网查询 VirusTotal 等服务。我们只上传应用的哈希值，不会上传完整 APK。你也可以选择仅使用本地功能。

### Q: 会有 iOS 版本吗？
A: 短期内不会。Huli 专注于 Android 平台。

### Q: 项目开源吗？
A: 是的，Huli 是开源项目，代码托管在 GitHub。欢迎 Star、Fork。

---

## 💖 赞助支持

> 这个项目由我个人在业余时间开发。如果你觉得它对你有帮助，欢迎通过以下方式支持我。

<div style="display: flex; gap: 24px; flex-wrap: wrap; justify-content: center; margin: 36px 0;">

<div style="width: 280px; border-radius: 24px; padding: 28px 22px; text-align: center; backdrop-filter: blur(24px); -webkit-backdrop-filter: blur(24px); border: 1px solid rgba(22, 119, 255, 0.35); background: linear-gradient(160deg, rgba(22, 119, 255, 0.18), rgba(22, 119, 255, 0.04)); box-shadow: 0 12px 40px rgba(22, 119, 255, 0.25), inset 0 1px 0 rgba(255, 255, 255, 0.25);">
  <div style="width: 60px; height: 60px; margin: 0 auto 14px; border-radius: 18px; background: linear-gradient(135deg, #1677ff, #0958d9); display: flex; align-items: center; justify-content: center; color: #fff; font-size: 30px; font-weight: bold; box-shadow: 0 6px 20px rgba(22, 119, 255, 0.4);">支</div>
  <h3 style="margin: 0 0 6px 0; color: #1677ff; font-size: 20px;">支付宝</h3>
  <p style="margin: 0 0 18px 0; font-size: 13px; color: #999;">推荐使用 · 支持花呗 / 信用卡</p>
  <a href="assets/alipay.png" target="_blank" style="text-decoration: none; -webkit-touch-callout: none;">
  <div style="background: #fff; border-radius: 20px; padding: 12px; margin: 0 auto 14px; width: 100%; max-width: 190px; aspect-ratio: 1 / 1; box-shadow: 0 8px 28px rgba(22, 119, 255, 0.25); cursor: pointer; transition: transform 0.2s, box-shadow 0.2s; user-select: none; -webkit-user-select: none; -webkit-touch-callout: none;" onmouseover="this.style.transform='scale(1.03)';this.style.boxShadow='0 12px 36px rgba(22, 119, 255, 0.35)'" onmouseout="this.style.transform='scale(1)';this.style.boxShadow='0 8px 28px rgba(22, 119, 255, 0.25)'">
    <img src="assets/alipay.png" alt="支付宝收款码（点击放大）" style="width: 100%; height: 100%; object-fit: contain; border-radius: 12px; user-select: none; -webkit-user-select: none; -webkit-user-drag: none; -webkit-touch-callout: none; pointer-events: none;" draggable="false" />
  </div>
  </a>
  <p style="margin: 0; font-size: 13px; color: #888;">👆 点击图片查看大图</p>
  <p style="margin: 8px 0 0 0; font-size: 14px; color: #333; font-weight: 600;">狐狸科技</p>
</div>

<div style="width: 280px; border-radius: 24px; padding: 28px 22px; text-align: center; backdrop-filter: blur(24px); -webkit-backdrop-filter: blur(24px); border: 1px solid rgba(7, 193, 96, 0.35); background: linear-gradient(160deg, rgba(7, 193, 96, 0.18), rgba(7, 193, 96, 0.04)); box-shadow: 0 12px 40px rgba(7, 193, 96, 0.25), inset 0 1px 0 rgba(255, 255, 255, 0.25);">
  <div style="width: 60px; height: 60px; margin: 0 auto 14px; border-radius: 18px; background: linear-gradient(135deg, #07c160, #06ad56); display: flex; align-items: center; justify-content: center; color: #fff; font-size: 30px; font-weight: bold; box-shadow: 0 6px 20px rgba(7, 193, 96, 0.4);">微</div>
  <h3 style="margin: 0 0 6px 0; color: #07c160; font-size: 20px;">微信支付</h3>
  <p style="margin: 0 0 18px 0; font-size: 13px; color: #999;">微信扫码，方便快捷</p>
  <a href="assets/wechat.png" target="_blank" style="text-decoration: none; -webkit-touch-callout: none;">
  <div style="background: #fff; border-radius: 20px; padding: 12px; margin: 0 auto 14px; width: 100%; max-width: 190px; aspect-ratio: 1 / 1; box-shadow: 0 8px 28px rgba(7, 193, 96, 0.25); cursor: pointer; transition: transform 0.2s, box-shadow 0.2s; user-select: none; -webkit-user-select: none; -webkit-touch-callout: none;" onmouseover="this.style.transform='scale(1.03)';this.style.boxShadow='0 12px 36px rgba(7, 193, 96, 0.35)'" onmouseout="this.style.transform='scale(1)';this.style.boxShadow='0 8px 28px rgba(7, 193, 96, 0.25)'">
    <img src="assets/wechat.png" alt="微信收款码（点击放大）" style="width: 100%; height: 100%; object-fit: contain; border-radius: 12px; user-select: none; -webkit-user-select: none; -webkit-user-drag: none; -webkit-touch-callout: none; pointer-events: none;" draggable="false" />
  </div>
  </a>
  <p style="margin: 0; font-size: 13px; color: #888;">👆 点击图片查看大图</p>
  <p style="margin: 8px 0 0 0; font-size: 14px; color: #333; font-weight: 600;">狐狸</p>
</div>

<div style="width: 280px; border-radius: 24px; padding: 28px 22px; text-align: center; backdrop-filter: blur(24px); -webkit-backdrop-filter: blur(24px); border: 1px solid rgba(168, 85, 247, 0.35); background: linear-gradient(160deg, rgba(168, 85, 247, 0.18), rgba(168, 85, 247, 0.04)); box-shadow: 0 12px 40px rgba(168, 85, 247, 0.25), inset 0 1px 0 rgba(255, 255, 255, 0.25);">
  <div style="width: 60px; height: 60px; margin: 0 auto 14px; border-radius: 18px; background: linear-gradient(135deg, #a855f7, #9333ea); display: flex; align-items: center; justify-content: center; font-size: 30px; box-shadow: 0 6px 20px rgba(168, 85, 247, 0.4);">💖</div>
  <h3 style="margin: 0 0 6px 0; color: #a855f7; font-size: 20px;">爱发电</h3>
  <p style="margin: 0 0 18px 0; font-size: 13px; color: #999;">长期赞助 · 解锁更多权益</p>
  <a href="assets/afdian.png" target="_blank" style="text-decoration: none; -webkit-touch-callout: none;">
  <div style="background: #fff; border-radius: 20px; padding: 12px; margin: 0 auto 14px; width: 100%; max-width: 190px; aspect-ratio: 1 / 1; box-shadow: 0 8px 28px rgba(168, 85, 247, 0.25); cursor: pointer; transition: transform 0.2s, box-shadow 0.2s; user-select: none; -webkit-user-select: none; -webkit-touch-callout: none;" onmouseover="this.style.transform='scale(1.03)';this.style.boxShadow='0 12px 36px rgba(168, 85, 247, 0.35)'" onmouseout="this.style.transform='scale(1)';this.style.boxShadow='0 8px 28px rgba(168, 85, 247, 0.25)'">
    <img src="assets/afdian.png" alt="爱发电主页码（点击放大）" style="width: 100%; height: 100%; object-fit: contain; border-radius: 12px; user-select: none; -webkit-user-select: none; -webkit-user-drag: none; -webkit-touch-callout: none; pointer-events: none;" draggable="false" />
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
