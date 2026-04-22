import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../data/repositories/auth_repository.dart';
import '../services/storage_service.dart';
import '../../data/models/user_model.dart';

class UserController extends GetxController {
  final AuthRepository _authRepository;
  final StorageService _storageService;
  final Logger _logger = Logger();
  
  var isLoading = false.obs;
  var error = ''.obs;
  var isLoggedIn = false.obs;
  var user = Rxn<User>();

  UserController(this._authRepository, this._storageService) {
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final userJson = await _storageService.getString('user');
    if (userJson != null) {
      try {
        final userData = User.fromJson(userJson as Map<String, dynamic>);
        user.value = userData;
        isLoggedIn.value = true;
      } catch (e) {
        _logger.e('Failed to parse user data: $e');
        await logout();
      }
    }
  }

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    error.value = '';
    
    try {
      final response = await _authRepository.login(email, password);
      
      final userData = User(
        token: response['token'] ?? 'mock_token',
        name: response['name'] ?? '用户',
        email: email,
        avatar: response['avatar'] ?? 'https://via.placeholder.com/100',
        id: response['id'],
        phone: response['phone'],
        address: response['address'],
        isActive: response['isActive'],
        createdAt: response['createdAt'],
        updatedAt: response['updatedAt'],
      );
      
      await _storageService.setSecureString('auth_token', userData.token!);
      await _storageService.setString('user', userData.toJson().toString());
      
      user.value = userData;
      isLoggedIn.value = true;
    } catch (e) {
      error.value = e.toString();
      isLoggedIn.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> register(String username, String email, String password) async {
    isLoading.value = true;
    error.value = '';
    
    try {
      await _authRepository.register(username, email, password);
      await login(email, password);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await _storageService.removeSecureString('auth_token');
    await _storageService.remove('user');
    
    isLoggedIn.value = false;
    user.value = null;
  }

  Future<void> forgotPassword(String email) async {
    isLoading.value = true;
    error.value = '';
    
    try {
      await _authRepository.forgotPassword(email);
      Get.snackbar(
        '成功',
        '重置密码邮件已发送',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resetPassword(String token, String newPassword) async {
    isLoading.value = true;
    error.value = '';
    
    try {
      await _authRepository.resetPassword(token, newPassword);
      Get.snackbar(
        '成功',
        '密码重置成功',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateUserInfo(Map<String, dynamic> userData) async {
    isLoading.value = true;
    error.value = '';
    
    try {
      if (user.value != null) {
        final updatedUser = User(
          token: user.value!.token,
          name: userData['name'] ?? user.value!.name,
          email: userData['email'] ?? user.value!.email,
          avatar: userData['avatar'] ?? user.value!.avatar,
          id: user.value!.id,
          phone: userData['phone'] ?? user.value!.phone,
          address: userData['address'] ?? user.value!.address,
          isActive: user.value!.isActive,
          createdAt: user.value!.createdAt,
          updatedAt: DateTime.now().toIso8601String(),
        );
        
        await _storageService.setString('user', updatedUser.toJson().toString());
        user.value = updatedUser;
        
        Get.snackbar(
          '成功',
          '用户信息已更新',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
