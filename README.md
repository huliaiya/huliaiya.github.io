# 🦊 HuLiAPI 狐狸API

> 免费API接口调用管理平台

<p align="center">
  <img src="https://img.shields.io/badge/version-2.0.0-blueviolet?style=for-the-badge" alt="version">
  <img src="https://img.shields.io/badge/PHP-%3E%3D7.4-777BB4?style=for-the-badge&logo=php" alt="PHP">
  <img src="https://img.shields.io/badge/license-MIT-green?style=for-the-badge" alt="License">
</p>

---

## 📋 更新日志

### ✨ v2.0.0 `2026-07-26`

#### 🎯 全新功能

- 🌈 全局彩虹渐变毛玻璃主题，所有页面和弹窗统一视觉风格
- ✨ 点击粒子动画（Sparkle），页面交互时喷射彩色星星
- 🎛️ 后台新增「点击粒子动画」开关，可自由控制前台动画显示
- 💰 爱发电收款码支持，后台支付设置可直接配置
- 📜 安装流程增加免责声明步骤，需勾选同意后才能继续

#### 🔒 安全加固

- 🛡️ 全站 CSRF Token 保护，所有 POST 请求（含安装流程）需携带有效令牌
- 🚫 API 源码安全审查，`eval()`、`system()` 等危险函数拦截
- 🔑 登录防暴力破解，15分钟内失败5次自动封禁30分钟
- 💎 密码哈希升级为 `password_hash()`，向下兼容旧密码
- 📁 `Core/.htaccess` 精准保护，仅放行 `install.php`，其他敏感文件禁止访问
- 🔐 安装锁文件权限设为 0444（只读），防止被 Web 进程删除
- 🧹 XSS 防护增强，输出统一使用 `htmlspecialchars()` 转义
- 🍪 Session 安全配置：`httponly`、`samesite=Lax`、`secure`
- 🚷 移除 API Key GET 参数传递方式，仅保留 HTTP Header（`X-API-Key`）认证，防止密钥泄露到日志和浏览器历史
- 🛑 `sendTestEmail` / `exitLogin` 强制 POST 请求，防止 CSRF 触发发送垃圾邮件或强制注销管理员
- 🚫 `end_script` 字段禁止通过后台设置修改，彻底杜绝存储型 XSS 注入
- 🔒 `getWebSetting` 接口移除 `close_site`、`cc_protect`、`fire_wall`、`end_script` 等敏感字段，防止内部配置暴露
- 🛡️ 新增根目录 `.htaccess`，设置安全响应头（X-Content-Type-Options、X-Frame-Options 等），禁止访问 `.sql`、`.log`、`.bak` 等敏感文件类型
- 🔇 致命错误处理页面移除服务器文件路径输出，防止信息泄露

#### 🐛 问题修复

| 修复项 | 说明 |
|--------|------|
| 安装流程不可用 | `switch/case` 类型不匹配，`intval()` 返回整数与字符串比较永远不相等 |
| 安装自动登录 | 未验证数据库管理员是否存在就直接设置 session |
| 密码空值绕过 | 使用 `==` 松散比较，空字符串绕过前端校验 |
| API 接口不通 | `API/.htaccess` 禁止所有访问，导致外部无法调用接口 |
| 前台功能瘫痪 | `Data/.htaccess` 禁止所有访问，导致 `post.php`/`api.php` 无法被 AJAX 调用 |
| Core 目录访问 | `Core/.htaccess` 禁止 `install.php`，导致安装流程 Access Denied |
| 用户信息编辑 | 弹窗按钮遮挡 QQ 号且保存功能无效 |
| SMTP 配置保存 | 保存按钮绑定错误方法，提交后无响应 |
| 企业微信推送 | Webhook 密钥 XOR 混淆字节序错误 |
| HTML 解析异常 | `textarea` 自闭合标签导致页面结构错误 |
| JS 报错 | `mdui` 未加载时直接调用 `mdui.snackbar()` 崩溃 |
| JSON 解析 | `JSON.parse(data)` 重复调用且无 `try-catch` |
| CSS 无效值 | `vertical-align: center` 不是合法值，`font-size` 缺分号 |
| 路径依赖 | `config.inc.php` 使用相对路径，不同工作目录下失效 |
| SQL 非标准 | `&&` 代替 `AND`，不符合 SQL 标准 |
| 搜索方法属性错误 | `control.html` 中 `focus` 方法设置不存在的 `code` 属性 |
| 免责声明无弹窗 | 安装页面不勾选同意直接点击按钮，没有弹窗提示 |
| 安装跳步 | session 残留导致配置数据步骤被跳过，重新安装时可能直接跳到后续步骤 |

#### ⚡ 体验优化

- 彩虹流动渐变动画应用于按钮、标题栏、FAB 等交互元素
- 毛玻璃效果覆盖卡片、弹窗、侧边栏、工具栏
- Snackbar/Toast 提示增强毛玻璃样式
- 全局路径改为 `__DIR__` 绝对路径，消除工作目录依赖
- 错误码规范统一，失败统一返回 `-1`
- 代码风格统一，所有 Session 比较改为严格比较 `===`
- `sendMail()` 添加 `__ROOT_DIR__` 定义检查，防止未定义时报错

---

### 🚀 v1.x `早期版本`

- API 接口管理系统基础框架
- 后台管理面板：接口增删改查、分类管理、公告管理
- 用户反馈系统
- 友情链接管理
- 登录日志与访问日志记录
- CC 防护与 SQL 注入拦截
- SMTP 邮件发送功能
- API 密钥认证体系
- 网站开关控制与防火墙功能

---

<p align="center">
  &copy; HuLiAPI 狐狸API · 免费API接口调用平台
</p>