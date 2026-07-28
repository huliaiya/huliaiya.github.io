# huli 项目说明

基于 Android Navigation Drawer 模板的应用，包含侧边栏导航、深色模式切换、液态玻璃效果。

---

## 更新日志

---

### 2026-07-28：修复 Toolbar 白条遮挡汉堡菜单按钮

问题：浅色模式下顶部 Toolbar 显示为白条，汉堡菜单按钮（打开侧边栏）不可见。

根因：Toolbar 背景为 `#80FFFFFF`（半透明白色），同时 `AppBarOverlay` 使用 `Dark.ActionBar` 让图标和文字变成白色，白色图标在白色背景上完全不可见。

修复：
- Toolbar 背景改为 `@android:color/transparent`，让液态玻璃背景透过 Toolbar 显示
- 浅色模式 `AppBarOverlay` 改为 `ThemeOverlay.AppCompat.Light`（深色图标，透明背景上可见）
- 深色模式 `values-night/themes.xml` 新增 `AppBarOverlay` 使用 `Dark.ActionBar`（浅色图标）

修改文件：
- `app/src/main/res/layout/app_bar_main.xml` — Toolbar 背景改透明
- `app/src/main/res/values/themes.xml` — AppBarOverlay 改为 Light
- `app/src/main/res/values-night/themes.xml` — 新增深色模式 AppBarOverlay

---

### 2026-07-28：修复 Release 构建 AAPT proto XML 解析错误

问题：`processReleaseResources` / `processDebugResources` 报错 `failed to parse proto XML`，不同文件随机出现该错误。

根因：`compileSdk = 36`（Android 16 预览版 SDK）的 AAPT2 存在 proto XML 解析 bug，导致构建随机失败。降级到 compileSdk 34 后，依赖库 `androidx.core:core:1.17.0` 等要求 compileSdk 36，产生版本冲突。

修复：
- 将 `compileSdk` 从 36 降至稳定版 34（与 `targetSdk` 一致）
- 降低所有 AndroidX 依赖版本到兼容 compileSdk 34 的版本：
  - core: 1.17.0 → 1.13.1
  - appcompat: 1.7.1 → 1.7.0
  - material: 1.13.0 → 1.12.0
  - constraintlayout: 2.2.1 → 2.1.4
  - lifecycle: 2.9.4 → 2.8.7
  - navigation: 2.9.5 → 2.8.5
- `liquid_glass_dialog_background.xml` 和 `liquid_glass_surface.xml` 中 `@color/glass_card` 改为硬编码颜色值 `#4DFFFFFF`
- 在设备上执行 `./gradlew clean` 清理构建缓存后重新编译

修改文件：
- `app/build.gradle.kts` — compileSdk 36 → 34
- `gradle/libs.versions.toml` — 降低所有依赖版本
- `app/src/main/res/drawable/liquid_glass_dialog_background.xml`
- `app/src/main/res/drawable/liquid_glass_surface.xml`

---

### 2026-07-28：全面修复 UI 问题 + 删除所有注解 + 代码优化

#### 修复设置页文案重复

问题：设置页卡片标题"设置"与页面标题重复，"深色模式"描述与标题重复。

修复：
- 移除卡片内重复的"设置"标题
- "深色模式"改为"外观"，描述改为"选择应用的主题颜色方案"
- 调整卡片内布局顺序，分隔线移到单选按钮上方

修改文件：
- `app/src/main/res/layout/fragment_settings.xml` — 移除重复标题，调整布局
- `app/src/main/res/values/strings.xml` — theme_mode 改为"外观"，新增 theme_mode_desc

#### 修复 Toolbar 白条问题

问题：Toolbar 使用 liquid_glass_surface drawable 在浅色模式下显示为白色块。

修复：
- Toolbar 背景改为直接使用半透明颜色 `@color/glass_toolbar`（#80FFFFFF）
- 新增 values-night/colors.xml 覆盖夜间模式颜色（#80000000）
- AppBarLayout 添加 `app:elevation="0dp"` 去除阴影

修改文件：
- `app/src/main/res/layout/app_bar_main.xml` — Toolbar 背景改为颜色引用
- `app/src/main/res/values/colors.xml` — 新增 glass_toolbar 和 glass_toolbar_dark
- `app/src/main/res/values-night/colors.xml`（新增）— 夜间模式颜色覆盖，glass_card 改为深色半透明

#### 删除所有 Java 注解

从所有 Java 文件中移除了以下注解：
- `@Override`
- `@NonNull`
- `@Nullable`

涉及文件（全部 9 个 Java 文件）：
1. `MainActivity.java`
2. `HomeFragment.java`
3. `GalleryFragment.java`
4. `SlideshowFragment.java`
5. `SettingsFragment.java`
6. `SettingsViewModel.java`
7. `ThemeManager.java`
8. `LiquidGlassUtil.java`
9. （HomeViewModel / GalleryViewModel / SlideshowViewModel 本身无注解）

#### 修复 NavigationView 模糊导致文字不可读

问题：对 NavigationView 整体应用 RenderEffect 模糊，导致菜单文字模糊不可读。

修复：移除 applyLiquidGlassToNavView() 方法，不再对侧边栏施加模糊效果。

#### 修复 Snackbar 模糊导致文字不可读

问题：对 Snackbar 视图施加 RenderEffect 模糊，导致提示文字模糊不可读。

修复：Snackbar 不再施加 RenderEffect，保持文字清晰。

#### 修复窗口布局问题

问题：`FLAG_LAYOUT_NO_LIMITS` 导致内容顶到状态栏下方，`FLAG_BLUR_BEHIND` 和 `FLAG_TRANSLUCENT_STATUS/NAVIGATION` 已弃用。

修复：
- 移除所有已弃用的 Window flag
- 仅保留 `window.setBackgroundBlurRadius()` 实现窗口背景模糊
- 模糊半径从 60 降为 30，避免过度模糊

#### 修复 onBackPressed 弃用问题

问题：`onBackPressed()` 在高版本 API 已弃用。

修复：改用 `OnBackPressedDispatcher` + `OnBackPressedCallback` 实现返回拦截。

#### 移除未使用权限

问题：AndroidManifest 中声明了 `FOREGROUND_SERVICE_DATA_SYNC` 权限但未使用。

修复：从 AndroidManifest.xml 中移除该权限。

#### 代码安全与质量优化

- ThemeManager 构造函数添加 null 检查，使用 `getApplicationContext()` 防止 Activity 泄漏
- LiquidGlassUtil 移除未使用的 import（ViewGroup、WindowManager、ViewCompat）
- LiquidGlassUtil 移除可能 NPE 的 `applyTranslucentBackground()` 方法
- LiquidGlassUtil 移除未使用的 `applyLiquidGlassBackground()` 方法
- SettingsFragment 简化玻璃效果应用逻辑，只对卡片施加效果，不对子 View 重复施加
- Fragment 玻璃效果从 onViewCreated 移到 onCreateView 末尾，减少生命周期复杂度
- 窗口模糊添加 null 检查（`dialog.getWindow() != null`）
- 卡片透明度从 0.75-0.8 调整为 0.85，提升文字可读性

#### 文件变更清单

修改文件（10个）：
1. `app/src/main/java/com/example/mynavigation/huli/MainActivity.java` — 删除注解，移除 NavView/Snackbar 模糊，移除弃用 flag，改用 OnBackPressedDispatcher
2. `app/src/main/java/com/example/mynavigation/huli/util/LiquidGlassUtil.java` — 删除注解，移除未使用 import 和方法
3. `app/src/main/java/com/example/mynavigation/huli/util/ThemeManager.java` — 删除注解，添加 null 检查，使用 applicationContext
4. `app/src/main/java/com/example/mynavigation/huli/ui/settings/SettingsFragment.java` — 删除注解，简化玻璃效果逻辑
5. `app/src/main/java/com/example/mynavigation/huli/ui/settings/SettingsViewModel.java` — 删除注解
6. `app/src/main/java/com/example/mynavigation/huli/ui/home/HomeFragment.java` — 删除注解，合并玻璃效果到 onCreateView
7. `app/src/main/java/com/example/mynavigation/huli/ui/gallery/GalleryFragment.java` — 同上
8. `app/src/main/java/com/example/mynavigation/huli/ui/slideshow/SlideshowFragment.java` — 同上
9. `app/src/main/res/layout/fragment_settings.xml` — 移除重复标题，调整布局
10. `app/src/main/res/layout/app_bar_main.xml` — Toolbar 改用颜色背景
11. `app/src/main/res/values/strings.xml` — 修改文案
12. `app/src/main/res/values/colors.xml` — 新增 glass_toolbar 颜色
13. `app/src/main/AndroidManifest.xml` — 移除未使用权限

新增文件（1个）：
1. `app/src/main/res/values-night/colors.xml` — 夜间模式颜色覆盖

---

### 2026-07-28：添加液态玻璃效果 + 设置页面 + 深色模式

#### 侧边栏新增「设置」入口

在抽屉菜单底部新增「系统」分组，内含「设置」选项，点击后跳转到设置页面。

修改文件：
- `app/src/main/res/menu/activity_main_drawer.xml` — 添加设置菜单项（nav_settings）
- `app/src/main/res/navigation/mobile_navigation.xml` — 添加 nav_settings 导航目的地，指向 SettingsFragment
- `app/src/main/res/values/strings.xml` — 添加设置相关中文字符串
- `app/src/main/java/com/example/mynavigation/huli/MainActivity.java` — 将 nav_settings 加入 AppBarConfiguration 顶级目的地列表

#### 设置页面 — 深色模式切换

新增文件：
- `app/src/main/java/com/example/mynavigation/huli/ui/settings/SettingsFragment.java`
- `app/src/main/java/com/example/mynavigation/huli/ui/settings/SettingsViewModel.java`
- `app/src/main/java/com/example/mynavigation/huli/util/ThemeManager.java`
- `app/src/main/res/layout/fragment_settings.xml`

支持三种模式：
| 模式 | 说明 | 对应 AppCompatDelegate 值 |
|------|------|--------------------------|
| 跟随系统 | 自动跟随系统深浅色设置（API 31+）| MODE_NIGHT_FOLLOW_SYSTEM |
| 浅色模式 | 强制使用浅色主题 | MODE_NIGHT_NO |
| 深色模式 | 强制使用深色主题 | MODE_NIGHT_YES |

#### 液态玻璃效果（全应用覆盖）

实现原理：
- Android 12+ (API 31+)：使用 RenderEffect.createBlurEffect() 实现 GPU 硬件加速的实时模糊
- Window 模糊：window.setBackgroundBlurRadius() 对窗口背景进行模糊
- 半透明材质：自定义 shape drawable 配合半透明颜色模拟玻璃质感

新增文件：
- `app/src/main/java/com/example/mynavigation/huli/util/LiquidGlassUtil.java`
- `app/src/main/res/drawable/liquid_glass_background.xml`
- `app/src/main/res/drawable/liquid_glass_surface.xml`
- `app/src/main/res/drawable/liquid_glass_dialog_background.xml`

#### 主题适配

修改文件：
- `app/src/main/res/values/themes.xml` — 新增 LiquidGlassDialog 弹窗主题
- `app/src/main/res/values-night/themes.xml` — 同步夜间主题
- `app/src/main/res/values/colors.xml` — 新增玻璃材质颜色

---

### 2026-07-28：修复 minSdk 版本冲突

编译报错：`uses-sdk:minSdkVersion 16 cannot be smaller than version 21 declared in library [androidx.navigation:navigation-runtime-android:2.9.5]`

修复：将 `app/build.gradle.kts` 中的 `minSdk = 16` 改为 `minSdk = 21`。

---

### 2026-07-28：Navigation Drawer 模板（初始版本）

项目基于 Android Navigation Drawer 模板创建，包含：
- MainActivity + DrawerLayout 侧边栏导航
- 三个页面：Home、Gallery、Slideshow（各含 Fragment + ViewModel）
- Toolbar 顶部栏 + FloatingActionButton 浮动按钮
- Navigation Component 导航组件
- ViewBinding 数据绑定
- Material Design 主题（DayNight 深浅色支持）
- Gradle 9.0.0 + AGP 8.13.0 + Java 17