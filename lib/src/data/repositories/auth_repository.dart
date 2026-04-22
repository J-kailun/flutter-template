abstract class AuthRepository {
  Future<Map<String, dynamic>> login(String email, String password);
  Future<void> logout();
  Future<void> register(String username, String email, String password);
  Future<void> forgotPassword(String email);
  Future<void> resetPassword(String token, String newPassword);
}
