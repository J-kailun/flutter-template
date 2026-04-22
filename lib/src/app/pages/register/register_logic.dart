import 'package:get/get.dart';
import 'register_state.dart';
import '../../../core/controllers/user_controller.dart';

class RegisterLogic extends GetxController {
  final RegisterState state = RegisterState();
  final UserController _userController = Get.find();

  void setUsername(String value) {
    state.username.value = value;
  }

  void setEmail(String value) {
    state.email.value = value;
  }

  void setPassword(String value) {
    state.password.value = value;
  }

  void setConfirmPassword(String value) {
    state.confirmPassword.value = value;
  }

  void togglePasswordVisibility() {
    state.isPasswordVisible.value = !state.isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    state.isConfirmPasswordVisible.value = !state.isConfirmPasswordVisible.value;
  }

  void toggleAgreeToTerms() {
    state.agreeToTerms.value = !state.agreeToTerms.value;
  }

  bool validateInputs() {
    if (state.username.value.isEmpty) {
      state.error.value = '请输入用户名';
      return false;
    }
    if (state.username.value.length < 3) {
      state.error.value = '用户名长度至少为3位';
      return false;
    }
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
    if (state.confirmPassword.value.isEmpty) {
      state.error.value = '请确认密码';
      return false;
    }
    if (state.password.value != state.confirmPassword.value) {
      state.error.value = '两次输入的密码不一致';
      return false;
    }
    if (!state.agreeToTerms.value) {
      state.error.value = '请同意用户协议和隐私政策';
      return false;
    }
    return true;
  }

  Future<void> register() async {
    if (!validateInputs()) {
      return;
    }

    state.isLoading.value = true;
    state.error.value = '';

    try {
      await _userController.register(
        state.username.value,
        state.email.value,
        state.password.value,
      );
      
      if (_userController.isLoggedIn.value) {
        Get.back();
        Get.snackbar(
          '注册成功',
          '欢迎加入！',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        state.error.value = '注册失败，请稍后重试';
      }
    } catch (e) {
      state.error.value = '注册失败：${e.toString()}';
    } finally {
      state.isLoading.value = false;
    }
  }

  void goToLogin() {
    Get.back();
  }

  void goToTerms() {
    Get.toNamed('/terms');
  }

  void goToPrivacy() {
    Get.toNamed('/privacy');
  }
}
