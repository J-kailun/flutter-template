
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {

  final Logger _logger = Logger();
  SharedPreferences? _prefs;
  late final FlutterSecureStorage _secureStorage;
  bool _initialized = false;
  

  StorageService() {
    _secureStorage = const FlutterSecureStorage();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      if (_prefs == null) {
        _prefs = await SharedPreferences.getInstance();
        _initialized = true;
      }
    } catch (e) {
      _logger.e('StorageService initialization failed: $e');
      _initialized = false;
    }
  }

  Future<void> _ensureInitialized() async {
    if (!_initialized) {
      await _initialize();
    }
  }

  // 存储字符串
  Future<void> setString(String key, String value) async {
    await _ensureInitialized();
    if (_initialized && _prefs != null) {
      await _prefs!.setString(key, value);
    }
  }

  // 获取字符串
  Future<String?> getString(String key) async {
    await _ensureInitialized();
    if (_initialized && _prefs != null) {
      return _prefs!.getString(key);
    }
    return null;
  }

  // 存储布尔值
  Future<void> setBool(String key, bool value) async {
    await _ensureInitialized();
    if (_initialized && _prefs != null) {
      await _prefs!.setBool(key, value);
    }
  }

  // 获取布尔值
  Future<bool?> getBool(String key) async {
    await _ensureInitialized();
    if (_initialized && _prefs != null) {
      return _prefs!.getBool(key);
    }
    return null;
  }

  // 存储整数
  Future<void> setInt(String key, int value) async {
    await _ensureInitialized();
    if (_initialized && _prefs != null) {
      await _prefs!.setInt(key, value);
    }
  }

  // 获取整数
  Future<int?> getInt(String key) async {
    await _ensureInitialized();
    if (_initialized && _prefs != null) {
      return _prefs!.getInt(key);
    }
    return null;
  }

  // 存储浮点数
  Future<void> setDouble(String key, double value) async {
    await _ensureInitialized();
    if (_initialized && _prefs != null) {
      await _prefs!.setDouble(key, value);
    }
  }

  // 获取浮点数
  Future<double?> getDouble(String key) async {
    await _ensureInitialized();
    if (_initialized && _prefs != null) {
      return _prefs!.getDouble(key);
    }
    return null;
  }

  // 存储列表
  Future<void> setStringList(String key, List<String> value) async {
    await _ensureInitialized();
    if (_initialized && _prefs != null) {
      await _prefs!.setStringList(key, value);
    }
  }

  // 获取列表
  Future<List<String>?> getStringList(String key) async {
    await _ensureInitialized();
    if (_initialized && _prefs != null) {
      return _prefs!.getStringList(key);
    }
    return null;
  }

  // 删除键值对
  Future<void> remove(String key) async {
    await _ensureInitialized();
    if (_initialized && _prefs != null) {
      await _prefs!.remove(key);
    }
  }

  // 清空所有数据
  Future<void> clear() async {
    await _ensureInitialized();
    if (_initialized && _prefs != null) {
      await _prefs!.clear();
    }
  }

  // 安全存储（用于敏感数据）
  Future<void> setSecureString(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  // 获取安全存储
  Future<String?> getSecureString(String key) async {
    return await _secureStorage.read(key: key);
  }

  // 删除安全存储
  Future<void> removeSecureString(String key) async {
    await _secureStorage.delete(key: key);
  }

  // 清空所有安全存储
  Future<void> clearSecure() async {
    await _secureStorage.deleteAll();
  }
}
