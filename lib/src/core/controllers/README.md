# 全局控制器架构说明

## 目录结构
```
lib/src/core/controllers/
└── user_controller.dart    # 用户全局控制器
```

## 架构说明

### 为什么将 AuthController 重构为 UserController？

#### 1. **语义化命名**
- **AuthController**：侧重于"认证"（Authentication）
- **UserController**：侧重于"用户"（User）
- UserController 的职责更清晰：管理用户状态和用户信息

#### 2. **职责更明确**
UserController 负责：
- 用户登录状态管理（isLoggedIn）
- 用户信息存储和读取（user）
- 用户认证业务逻辑（login、register、logout）
- 用户信息更新（updateUserInfo）

#### 3. **位置更合理**
- **旧位置**：`lib/src/presentation/controllers/`
- **新位置**：`lib/src/core/controllers/`
- **原因**：UserController 是全局控制器，应该放在核心层，而不是表现层

## UserController 职责

### 1. 全局状态管理
```dart
var isLoggedIn = false.obs;  // 登录状态
var user = Rxn<User>();     // 用户信息
```

### 2. 认证业务逻辑
- `login()` - 用户登录
- `register()` - 用户注册
- `logout()` - 用户登出
- `forgotPassword()` - 忘记密码
- `resetPassword()` - 重置密码

### 3. 用户信息管理
- `updateUserInfo()` - 更新用户信息
- `_checkLoginStatus()` - 检查登录状态

### 4. 数据持久化
- 使用 StorageService 存储用户信息
- 使用安全存储存储 token

## 使用方式

### 在页面级 Logic 中使用
```dart
class LoginLogic extends GetxController {
  final UserController _userController = Get.find();
  
  Future<void> login() async {
    await _userController.login(email, password);
    if (_userController.isLoggedIn.value) {
      // 登录成功
    }
  }
}
```

### 在页面中监听用户状态
```dart
Obx(() {
  if (_userController.isLoggedIn.value) {
    return Text('欢迎，${_userController.user.value?.name}');
  } else {
    return Text('请登录');
  }
})
```

## 架构优势

### 1. **单一职责**
- UserController 只负责用户相关的全局状态和业务逻辑
- 页面级 Logic 只负责页面特定的业务逻辑

### 2. **分层清晰**
- **Core 层**：全局控制器、服务、拦截器
- **Presentation 层**：页面级 Logic、View、State

### 3. **可维护性**
- 全局用户状态集中管理
- 便于追踪用户状态变化
- 易于测试和调试

### 4. **可扩展性**
- 可以轻松添加新的用户相关功能
- 不影响页面级代码
- 支持多种认证方式

### 5. **语义化**
- UserController 名称清晰表达其职责
- 便于团队理解和协作

## 与其他组件的关系

### 1. 与 Repository
```dart
UserController -> AuthRepository -> ApiService -> API
```

### 2. 与 Service
```dart
UserController -> StorageService (存储用户信息)
UserController -> ApiService (通过 Repository)
```

### 3. 与页面级 Logic
```dart
LoginLogic -> UserController (调用认证方法)
MineLogic -> UserController (获取用户状态)
```

### 4. 与 Interceptor
```dart
AuthInterceptor -> StorageService (获取 token)
```

## 迁移说明

### 从 AuthController 到 UserController

#### 1. 更新导入路径
```dart
// 旧
import '../../../presentation/controllers/auth_controller.dart';

// 新
import '../../../core/controllers/user_controller.dart';
```

#### 2. 更新变量名
```dart
// 旧
final AuthController _authController = Get.find();

// 新
final UserController _userController = Get.find();
```

#### 3. 功能保持不变
- 所有方法签名保持不变
- 所有状态变量保持不变
- 只需要更新引用

## 未来扩展

可以添加更多全局控制器到 `core/controllers/` 目录：

### 可能的控制器
- **ProductController** - 商品全局控制器
- **CartController** - 购物车全局控制器
- **OrderController** - 订单全局控制器
- **NotificationController** - 通知全局控制器
- **SettingsController** - 设置全局控制器

这些控制器都遵循相同的模式：
- 全局状态管理
- 业务逻辑封装
- 数据持久化
- 响应式更新
