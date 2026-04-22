import 'package:get/get.dart';
import 'mine_state.dart';
import '../../../core/controllers/user_controller.dart';

class MineLogic extends GetxController {
  final MineState state = MineState();
  final UserController _userController = Get.find();

  @override
  void onInit() {
    super.onInit();
    updateUserInfo();
  }

  void updateUserInfo() {
    state.isLoggedIn.value = _userController.isLoggedIn.value;
    if (state.isLoggedIn.value && _userController.user.value != null) {
      state.userName.value = _userController.user.value!.name ?? '';
      state.userAvatar.value = _userController.user.value!.avatar ?? '';
      state.userEmail.value = _userController.user.value!.email ?? '';
    }
  }

  void goToLogin() {
    Get.toNamed('/login');
  }

  void goToRegister() {
    Get.toNamed('/register');
  }

  Future<void> logout() async {
    await _userController.logout();
    state.isLoggedIn.value = false;
    state.userName.value = '';
    state.userAvatar.value = '';
    state.userEmail.value = '';
  }

  void goToOrders() {
    Get.toNamed('/orders');
  }

  void goToAddress() {
    Get.toNamed('/address');
  }

  void goToSettings() {
    Get.toNamed('/settings');
  }

  void goToHelp() {
    Get.toNamed('/help');
  }
}
