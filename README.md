# 🦊 HuLiAPI 狐狸API

> 免费API接口调用管理平台

<p align="center">
  <img src="https://img.shields.io/badge/version-2.0.0-blueviolet?style=for-the-badge" alt="version">
  <img src="https://img.shields.io/badge/PHP-%3E%3D7.4-777BB4?style=for-the-badge&logo=php" alt="PHP">
  <img src="https://img.shields.io/badge/license-MIT-green?style=for-the-badge" alt="License">
</p>

---

## 📋 更新日志

### ✨ v2.0.0 `2025-07-25`

#### 🎯 全新功能

- 🌈 全局彩虹渐变毛玻璃主题，所有页面和弹窗统一视觉风格
- ✨ 点击粒子动画（Sparkle），页面交互时喷射彩色星星
- 🎛️ 后台新增「点击粒子动画」开关，可自由控制前台动画显示
- 💰 爱发电收款码支持，后台支付设置可直接配置
- 📜 安装流程增加免责声明步骤，需勾选同意后才能继续

#### 🔒 安全加固

- 🛡️ 全站 CSRF Token 保护，所有 POST 请求需携带有效令牌
- 🚫 API 源码安全审查，`eval()`、`system()` 等危险函数拦截
- 🔑 登录防暴力破解，15分钟内失败5次自动封禁30分钟
- 💎 密码哈希升级为 `password_hash()`，向下兼容旧密码
- 📁 新增 `Core/.htaccess`，防止敏感文件被直接访问
- 🔐 安装锁文件权限设为 0444（只读），防止被 Web 进程删除
- 🧹 XSS 防护增强，输出统一使用 `htmlspecialchars()` 转义
- 🍪 Session 安全配置：`httponly`、`samesite=Lax`、`secure`

#### 🐛 问题修复

| 修复项 | 说明 |
|--------|------|
| 安装流程不可用 | `switch/case` 类型不匹配，`intval()` 返回整数与字符串比较永远不相等 |
| 安装自动登录 | 未验证数据库管理员是否存在就直接设置 session |
| 密码空值绕过 | 使用 `==` 松散比较，空字符串绕过前端校验 |
| API 接口不通 | `API/.htaccess` 禁止所有访问，导致外部无法调用接口 |
| 用户信息编辑 | 弹窗按钮遮挡 QQ 号且保存功能无效 |
| SMTP 配置保存 | 保存按钮绑定错误方法，提交后无响应 |
| 企业微信推送 | Webhook 密钥 XOR 混淆字节序错误 |
| HTML 解析异常 | `textarea` 自闭合标签导致页面结构错误 |
| JS 报错 | `mdui` 未加载时直接调用 `mdui.snackbar()` 崩溃 |
| JSON 解析 | `JSON.parse(data)` 重复调用且无 `try-catch` |
| CSS 无效值 | `vertical-align: center` 不是合法值，`font-size` 缺分号 |
| 路径依赖 | `config.inc.php` 使用相对路径，不同工作目录下失效 |
| SQL 非标准 | `&&` 代替 `AND`，不符合 SQL 标准 |

#### ⚡ 体验优化

- 彩虹流动渐变动画应用于按钮、标题栏、FAB 等交互元素
- 毛玻璃效果覆盖卡片、弹窗、侧边栏、工具栏
- Snackbar/Toast 提示增强毛玻璃样式
- 全局路径改为 `__DIR__` 绝对路径，消除工作目录依赖
- 错误码规范统一，失败统一返回 `-1`
- 代码风格统一，所有 Session 比较改为严格比较 `===`

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
