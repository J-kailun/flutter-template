import 'package:get/get.dart';
import 'login_state.dart';
import '../../../core/controllers/user_controller.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();
  final UserController _userController = Get.find();

  void setEmail(String value) {
    state.email.value = value;
  }

  void setPassword(String value) {
    state.password.value = value;
  }

  void togglePasswordVisibility() {
    state.isPasswordVisible.value = !state.isPasswordVisible.value;
  }

  void toggleRememberMe() {
    state.rememberMe.value = !state.rememberMe.value;
  }

  bool validateInputs() {
    if (state.email.value.isEmpty) {
      state.error.value = '请输入邮箱';
      return false;
    }
    if (!GetUtils.isEmail(state.email.value)) {
      state.error.value = '请输入有效的邮箱地址';
      return false;
    }
    if (state.password.value.isEmpty) {
      state.error.value = '请输入密码';
      return false;
    }
    if (state.password.value.length < 6) {
      state.error.value = '密码长度至少为6位';
      return false;
    }
    return true;
  }

  Future<void> login() async {
    if (!validateInputs()) {
      return;
    }

    state.isLoading.value = true;
    state.error.value = '';

    try {
      await _userController.login(state.email.value, state.password.value);
      
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
      } else {
        state.error.value = '登录失败，请检查邮箱和密码';
      }
    } catch (e) {
      state.error.value = '登录失败：${e.toString()}';
    } finally {
      state.isLoading.value = false;
    }
  }

  void goToRegister() {
    Get.toNamed('/register');
  }

  void goToForgotPassword() {
    Get.toNamed('/forgot-password');
  }
}
