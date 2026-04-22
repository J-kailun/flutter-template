# Flutter Mall 项目

一个基于 Flutter 开发的电商应用，包含首页、商城、个人中心等功能模块。

## 功能特性

- 🎨 现代化的 Material Design 界面
- 🌐 多语言支持（中文/英文）
- 📱 响应式布局，适配不同屏幕尺寸
- 🔐 用户认证系统（登录/注册）
- 🛒 商品展示和分类
- 📦 购物车功能
- 👤 个人中心
- 📱 设备信息检测
- 🌍 网络状态监测
- 🔄 主题切换支持

## 环境要求

- Flutter 3.35.1 或更高版本
- Dart 3.9.0 或更高版本
- Android SDK 36.1.0-rc1 或更高版本
- iOS 13.0 或更高版本（如果需要 iOS 支持）
- Android Studio 2025.1.2 或更高版本（推荐）
- Visual Studio Code（可选，推荐使用）

## 安装和运行

### 1. 克隆项目


### 2. 安装依赖

```bash
flutter pub get
```

### 3. 运行项目

#### Android

```bash
flutter run
```

#### iOS

```bash
flutter run -d ios
```

#### Web

```bash
flutter run -d chrome
```

### 4. 构建项目

#### Android APK

```bash
flutter build apk
```

#### iOS IPA

```bash
flutter build ios
```

#### Web

```bash
flutter build web
```

## 项目结构

```
lib/
├── src/
│   ├── app/
│   │   ├── pages/           # 页面组件
│   │   │   ├── home/        # 首页
│   │   │   ├── login/       # 登录页
│   │   │   ├── register/    # 注册页
│   │   │   ├── mall/        # 商城页
│   │   │   ├── mine/        # 个人中心
│   │   │   └── main/        # 主页面（底部导航）
│   │   ├── routes/          # 路由配置
│   │   └── widgets/         # 通用组件
│   ├── core/
│   │   ├── config/          # 配置文件
│   │   ├── controllers/     # 控制器
│   │   ├── services/        # 服务
│   │   └── utils/           # 工具类
│   └── data/
│       ├── models/          # 数据模型
│       └── repositories/    # 数据仓库
└── main.dart                # 应用入口
```

## 技术栈

### 核心框架
- **Flutter** - 跨平台 UI 框架
- **Dart** - 开发语言

### 状态管理 & 导航
- **GetX** - 轻量级状态管理和导航

### 网络
- **Dio** - 网络请求库
- **Retrofit** - RESTful API 客户端生成器
- **Connectivity Plus** - 网络状态监测

### 本地存储
- **SharedPreferences** - 简单键值存储
- **Hive** - 高性能 NoSQL 数据库

### 工具库
- **Logger** - 日志工具
- **JSON Annotation** - JSON 序列化
- **Flutter Secure Storage** - 安全存储
- **Crypto** - 加密工具
- **Device Info Plus** - 设备信息获取

### UI
- **Flutter ScreenUtil** - 屏幕适配
- **Intl** - 国际化支持
- **Flutter Localizations** - 本地化

## 开发指南

### 代码生成

项目使用了代码生成工具，在修改相关文件后需要运行：

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 多语言支持

多语言文件位于 `lib/src/core/services/lang/` 目录，支持中英文切换。

### 主题配置

主题配置位于 `lib/src/core/config/theme_config.dart`，支持亮色和暗色主题。

## 贡献指南

1. Fork 本项目
2. 创建特性分支 (`git checkout -b feature/amazing-feature`)
3. 提交更改 (`git commit -m 'Add some amazing feature'`)
4. 推送到分支 (`git push origin feature/amazing-feature`)
5. 打开 Pull Request

## 许可证

本项目采用 MIT 许可证 - 详情请参阅 [LICENSE](LICENSE) 文件

## 联系方式

- 项目链接: [https://github.com/yourusername/flutter-mall](https://github.com/yourusername/flutter-mall)
- 问题反馈: [Issues](https://github.com/yourusername/flutter-mall/issues)

---

**感谢使用 Flutter Mall 项目！** 🎉