# 路由级登录拦截实现

## 实现原理

使用 GetX 的 `GetMiddleware` 实现路由级的登录拦截，当用户访问需要登录的页面时，自动检查登录状态，如果未登录则重定向到登录页面。

## 目录结构
```
lib/src/app/routes/
├── app_routes.dart         # 路由配置
└── auth_middleware.dart    # 认证中间件
```

## 核心实现

### AuthMiddleware
**文件**：`auth_middleware.dart`

```dart
import 'package:get/get.dart';
import '../core/controllers/user_controller.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final UserController userController = Get.find();
    
    if (!userController.isLoggedIn.value) {
      // 记录用户原本想要访问的路由
      Get.arguments = route;
      return const RouteSettings(name: '/login');
    }
    
    return null;
  }
}
```

### 路由配置
**文件**：`app_routes.dart`

为需要登录的页面添加 `middlewares` 参数：

```dart
GetPage(
  name: checkout,
  page: () => const CheckoutPage(),
  transition: Transition.rightToLeft,
  middlewares: [AuthMiddleware()],
),
```

### 登录成功后重定向
**文件**：`login_logic.dart`

```dart
if (_userController.isLoggedIn.value) {
  // 检查是否有需要重定向的路由
  final String? redirectRoute = Get.arguments;
  if (redirectRoute != null && redirectRoute.isNotEmpty) {
    Get.offAllNamed(redirectRoute);
  } else {
    Get.back();
  }
  Get.snackbar(
    '登录成功',
    '欢迎回来！',
    snackPosition: SnackPosition.BOTTOM,
  );
}
```

## 配置的需要登录的页面

| 路由名称 | 路由路径 | 是否需要登录 |
|---------|---------|-------------|
| 结算页面 | `/checkout` | ✅ |
| 订单页面 | `/orders` | ✅ |
| 地址管理 | `/address` | ✅ |
| 设置页面 | `/settings` | ✅ |
| 帮助中心 | `/help` | ✅ |

## 工作流程

1. **用户访问需要登录的页面**（例如：`/checkout`）
2. **AuthMiddleware 拦截**：检查用户登录状态
3. **未登录**：重定向到 `/login`，并记录原始路由
4. **用户登录**：输入邮箱和密码
5. **登录成功**：自动重定向到原始访问的页面
6. **已登录**：直接访问目标页面

## 优势

### 1. **统一管理**
- 所有需要登录的页面都通过中间件统一管理
- 避免在每个页面手动检查登录状态
- 代码更加简洁和可维护

### 2. **用户体验**
- 自动跳转到登录页面
- 登录成功后自动返回原页面
- 流程更加顺畅

### 3. **安全性**
- 防止未登录用户直接访问需要授权的页面
- 统一的认证检查机制

### 4. **灵活性**
- 可以根据需要为不同页面设置不同的中间件
- 支持自定义重定向逻辑
- 易于扩展和修改

## 如何添加需要登录的页面

1. 在 `app_routes.dart` 中为页面添加 `middlewares: [AuthMiddleware()]`
2. 确保页面有对应的 Placeholder 或真实实现
3. 测试登录拦截功能

## 如何测试

1. **未登录状态**：
   - 访问需要登录的页面（例如：`/checkout`）
   - 应该自动跳转到登录页面
   - 登录成功后应该返回 `/checkout` 页面

2. **已登录状态**：
   - 访问需要登录的页面
   - 应该直接进入页面，不需要跳转到登录页面

3. **登出后**：
   - 登出后访问需要登录的页面
   - 应该自动跳转到登录页面

## 未来扩展

### 1. **权限控制**
可以扩展 AuthMiddleware 实现更复杂的权限控制：

```dart
class AuthMiddleware extends GetMiddleware {
  final List<String> requiredRoles;
  
  AuthMiddleware({this.requiredRoles = const []});
  
  @override
  RouteSettings? redirect(String? route) {
    final UserController userController = Get.find();
    
    if (!userController.isLoggedIn.value) {
      Get.arguments = route;
      return const RouteSettings(name: '/login');
    }
    
    // 检查角色权限
    if (requiredRoles.isNotEmpty) {
      // 检查用户是否有指定角色
      // ...
    }
    
    return null;
  }
}
```

### 2. **动态路由拦截**
可以根据 API 响应动态决定是否需要登录：

```dart
class DynamicAuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // 调用 API 检查路由权限
    // ...
    
    return null;
  }
}
```

### 3. **多因素认证**
可以实现多因素认证的路由拦截：

```dart
class MfaMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final UserController userController = Get.find();
    
    if (!userController.isLoggedIn.value) {
      Get.arguments = route;
      return const RouteSettings(name: '/login');
    }
    
    if (userController.requiresMfa.value) {
      Get.arguments = route;
      return const RouteSettings(name: '/mfa');
    }
    
    return null;
  }
}
```

## 总结

路由级登录拦截是一种优雅的实现方式，通过 GetX 的中间件机制，可以实现统一的登录状态检查和重定向逻辑，提升用户体验和代码可维护性。

当前实现已经覆盖了基本的登录拦截功能，未来可以根据需要扩展更多高级功能。
