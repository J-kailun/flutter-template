class EnvConfig {
  static const String dev = 'dev';
  static const String test = 'test';
  static const String prod = 'prod';

  static final Map<String, String> _baseUrls = {
    dev: 'https://api.dev.example.com',
    test: 'https://api.test.example.com',
    prod: 'https://api.example.com',
  };

  static String getBaseUrl(String env) {
    return _baseUrls[env] ?? _baseUrls[prod]!;
  }

  static String get currentEnv => dev; // 可以根据实际情况动态设置
}
