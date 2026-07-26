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
| HTML 解析异常 | `textarea` 自闭合标签导致页面结构错误 |
| JS 报错 | `mdui` 未加载时直接调用 `mdui.snackbar()` 崩溃 |
| JSON 解析 | `JSON.parse(data)` 重复调用且无 `try-catch` |
| CSS 无效值 | `vertical-align: center` 不是合法值，`font-size` 缺分号 |
| 路径依赖 | `config.inc.php` 使用相对路径，不同工作目录下失效 |
| SQL 非标准 | `&&` 代替 `AND`，不符合 SQL 标准 |
| 搜索方法属性错误 | `control.html` 中 `focus` 方法设置不存在的 `code` 属性 |
| 免责声明无弹窗 | 安装页面不勾选同意直接点击按钮，没有弹窗提示 |
| 安装跳步 | session 残留导致配置数据步骤被跳过，重新安装时可能直接跳到后续步骤 |
| `Core/.htaccess` 规则顺序 | Apache `<Files>` 后出现的覆盖先出现的，`deny all` 放在 `grant install.php` 后面导致 install.php 也被拒绝，安装页 Access Denied |
| `install.php` 缺少 `__ROOT_DIR__` | 加载 `connect.php` 时触发 `Access Denied` 检查，导致步骤2/3（数据库读写）直接终止，配置数据步骤被跳过 |
| URL 跳步漏洞 | 可通过 URL 参数 `?step=4` 绕过前置安装步骤直接跳到完成页 |
| `step_4.html` 相对路径 | 安装完成后的文件删除操作使用相对路径 `./Core/`，依赖工作目录，部分服务器配置下删除失败 |
| UPDATE 无 WHERE | `huli_config` 表 UPDATE 语句缺少 `WHERE`/`LIMIT`，多行数据时全部更新 |
| URL 协议硬编码 | 安装时站点 URL 写死 `http://`，HTTPS 环境下配置协议错误 |
| 参数注入漏洞 | `edit_link.html` 中 ID 参数未验证且未编码，可注入恶意数据 |
| AJAX 无错误回调 | `control_link.html` 网络请求失败时永久卡在加载状态 |
| 死代码残留 | `login_log.html` 存在无对应 UI 的分页代码，且缺少空状态提示 |
| 函数重复定义 | `API/function.php` 中 `addAccess()`/`addApiAccess()` 与 `Common.php` 重复定义导致致命错误 |
| highlightjs XSS | `doc.html` 中 highlightjs 未加载时直接输出未转义代码 |
| DOCTYPE 缺失 | `control_link.html` 缺少 `<!DOCTYPE html>` 声明导致渲染异常 |
| 空状态逻辑错误 | 多个模板 `v-if` 条件判断数组而非长度，空数组时仍显示列表 |
| fetch 无错误处理 | 多处 `fetch()` 调用缺少 `.catch()`，网络异常时无反馈 |
| URL 参数未编码 | 多处 API ID 拼接 URL 未使用 `encodeURIComponent()`，存在注入风险 |
| CSRF Token 丢失 | `footer.html` 中 `unset()` 过早清除 Token 导致后续请求失败 |

#### ⚡ 体验优化

- 彩虹流动渐变动画应用于按钮、标题栏、FAB 等交互元素
- 毛玻璃效果覆盖卡片、弹窗、侧边栏、工具栏
- Snackbar/Toast 提示增强毛玻璃样式
- 全局路径改为 `__DIR__` 绝对路径，消除工作目录依赖
- 错误码规范统一，失败统一返回 `-1`
- 代码风格统一，所有 Session 比较改为严格比较 `===`
- `sendMail()` 添加 `__ROOT_DIR__` 定义检查，防止未定义时报错
- 安装向导全新 UI 设计：毛玻璃卡片、Hero 图标区、顶部进度条、步骤徽章
- 安装按钮样式优化：靛蓝-紫罗兰渐变配色，统一圆角 14px，修复 MDUI 框架 `text-transform` 冲突
- 安装表单美化：浮动标签输入框、毛玻璃提示信息框、统一交互动画

#### 📦 部署文档

- 新增宝塔面板部署教程，覆盖安装、配置、SSL、权限、常见问题等全流程

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

## 🚀 宝塔面板部署教程

### 环境要求

- 宝塔面板 7.x 及以上
- PHP >= 7.4（推荐 8.0/8.1）
- MySQL 5.7 或 8.0
- Nginx 或 Apache

### 一、安装宝塔面板

如果服务器尚未安装宝塔面板，使用 SSH 连接服务器后执行：

```bash
# CentOS/RedHat
yum install -y wget && wget -O install.sh https://download.bt.cn/install/install_6.0.sh && sh install.sh

# Ubuntu/Debian
wget -O install.sh https://download.bt.cn/install/install-ubuntu_6.0.sh && sudo bash install.sh
```

安装完成后，在浏览器访问宝塔面板地址，使用面板提供的账号密码登录。

### 二、创建网站

1. 登录宝塔面板，点击左侧菜单「网站」→「添加站点」
2. 填写域名（如 `api.example.com`），如果没有域名可暂时填服务器 IP
3. 根目录保持默认 `/www/wwwroot/你的域名`
4. PHP 版本选择 **7.4** 或以上
5. 数据库选择 **MySQL**，记住自动生成的数据库名、用户名和密码
6. 点击「提交」创建站点

### 三、上传项目文件

1. 将 `HuLiAPI_v2.0.0.zip` 上传到网站根目录 `/www/wwwroot/你的域名/`
2. 在宝塔文件管理器中右键压缩包 →「解压」到当前目录
3. 确保解压后文件结构为：`/www/wwwroot/你的域名/index.php`、`/www/wwwroot/你的域名/Core/` 等
4. 删除多余的压缩包文件

### 四、设置目录权限

在宝塔文件管理器中，右键网站根目录 →「权限」：

| 目录/文件 | 权限 | 说明 |
|-----------|------|------|
| 整个网站根目录 | 755 | 目录默认权限 |
| 所有 PHP 文件 | 644 | 文件默认权限 |
| `Core/Database/` | 755 | 数据库配置目录，需可写 |
| `Core/Config/` | 755 | 配置文件目录，需可写 |
| `API/` | 755 | API 接口目录，需可写（动态生成接口文件） |

### 五、配置 Nginx 伪静态（Nginx 用户）

如果使用 Nginx，在网站设置 →「伪静态」中添加：

```nginx
location / {
    try_files $uri $uri/ /index.php?$query_string;
}

# 禁止访问敏感目录和文件
location ~ ^/(Core|Include|Template)/ {
    deny all;
    return 403;
}

location ~ \.(sql|log|bak|lock|env|yml|yaml)$ {
    deny all;
    return 403;
}
```

### 六、配置 Apache（Apache 用户）

如果使用 Apache，项目自带的 `.htaccess` 文件已包含所有安全规则，无需额外配置。确保 Apache 开启了 `mod_rewrite` 模块：

```bash
a2enmod rewrite
systemctl restart apache2
```

### 七、申请 SSL 证书（推荐）

1. 在网站设置 →「SSL」中选择「Let's Encrypt」
2. 勾选域名，点击「申请」
3. 申请成功后开启「强制 HTTPS」

### 八、配置 PHP 扩展

在宝塔面板 →「软件商店」→ 找到对应 PHP 版本 →「设置」→「安装扩展」，确保以下扩展已启用：

- `mysqli`（数据库连接）
- `curl`（API 请求）
- `mbstring`（多字节字符串处理）
- `openssl`（加密通信）
- `fileinfo`（文件信息检测）

### 九、设置 PHP 禁用函数

在 PHP 设置 →「禁用函数」中，**删除以下函数的禁用**（安装和运行需要）：

- `putenv`
- `proc_open`（仅 PHPMailer sendmail 模式需要，使用 SMTP 可不解禁）

> 注意：`eval`、`system`、`exec` 等危险函数应保持禁用状态，项目代码不依赖这些函数。

### 十、执行安装向导

1. 浏览器访问 `https://你的域名/`
2. 系统会自动跳转到安装页面
3. 阅读并勾选同意「免责声明与授权协议」
4. **第一步 - 数据库配置**：填写宝塔创建数据库时的主机（`127.0.0.1`）、端口（`3306`）、数据库名、用户名和密码
5. **第二步 - 网站信息**：设置网站标题、管理员用户名、管理员密码（至少6位）、邮箱和域名
6. **第三步 - SMTP 配置**（可选）：配置邮件服务器信息，可跳过后续在后台设置
7. 安装完成后，系统自动登录后台管理面板

### 十一、安装后安全建议

1. **删除安装文件**：安装完成后系统会自动创建 `Core/install.lock` 锁文件，防止重复安装。建议额外确认该文件存在
2. **修改默认密码**：登录后台后立即修改管理员密码
3. **配置 API Key**：在后台设置中查看并妥善保管系统自动生成的 API Key
4. **开启防火墙**：在后台开启 CC 防护和防火墙功能
5. **定期备份**：在宝塔面板 →「计划任务」中设置数据库自动备份
6. **关闭目录浏览**：确保 Nginx/Apache 配置中已关闭目录列表功能

### 十二、常见问题

<details>
<summary>安装页面显示 Access Denied</summary>

检查 `Core/.htaccess` 文件是否存在且规则正确。Nginx 用户需确认伪静态规则已正确配置。如问题持续，检查 PHP 版本是否 >= 7.4。
</details>

<details>
<summary>安装后页面空白或报错</summary>

1. 检查 PHP 扩展是否齐全（参考第六步）
2. 检查目录权限是否正确（参考第四步）
3. 查看宝塔面板的错误日志：网站设置 →「网站日志」→「错误日志」
</details>

<details>
<summary>API 接口无法访问（404）</summary>

Nginx 用户需确认伪静态规则中包含 `try_files` 配置。Apache 用户确认 `mod_rewrite` 已启用。检查 `API/` 目录权限是否为 755。
</details>

<details>
<summary>邮件发送失败</summary>

1. 确认 PHP `openssl` 和 `curl` 扩展已启用
2. 在后台「网站配置」→「SMTP 设置」中检查邮件服务器配置
3. 使用后台「发送测试邮件」功能验证配置
4. 部分云服务器默认封禁 25 端口，建议使用 465（SSL）或 587（TLS）端口
</details>

<details>
<summary>点击粒子动画卡顿</summary>

在后台「网站配置」中关闭「点击粒子动画」开关即可禁用动画效果，提升低性能设备体验。
</details>

---

<p align="center">
  &copy; HuLiAPI 狐狸API · 免费API接口调用平台
</p>