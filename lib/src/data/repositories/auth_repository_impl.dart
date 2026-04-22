import '../repositories/auth_repository.dart';
import '../../core/services/api_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiService _apiService;

  AuthRepositoryImpl(this._apiService);

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _apiService.post(
      '/auth/login',
      data: {'email': email, 'password': password},
    );
    return response.data;
  }

  @override
  Future<void> logout() async {
    await _apiService.post('/auth/logout');
  }

  @override
  Future<void> register(String username, String email, String password) async {
    await _apiService.post(
      '/auth/register',
      data: {
        'username': username,
        'email': email,
        'password': password,
      },
    );
  }

  @override
  Future<void> forgotPassword(String email) async {
    await _apiService.post(
      '/auth/forgot-password',
      data: {'email': email},
    );
  }

  @override
  Future<void> resetPassword(String token, String newPassword) async {
    await _apiService.post(
      '/auth/reset-password',
      data: {
        'token': token,
        'newPassword': newPassword,
      },
    );
  }
}
