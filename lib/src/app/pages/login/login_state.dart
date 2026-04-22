import 'package:get/get.dart';

class LoginState {
  final RxString email = ''.obs;
  final RxString password = ''.obs;
  final RxBool isLoading = false.obs;
  final RxBool isPasswordVisible = false.obs;
  final RxString error = ''.obs;
  final RxBool rememberMe = false.obs;
}
