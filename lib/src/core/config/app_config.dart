class AppConfig {
  // 应用配置
  static const String appName = 'Flutter Mall';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'A modern Flutter shopping mall app';

  // API 配置
  static const int apiTimeout = 10000; // 10 seconds
  static const int apiRetryCount = 3;

  // 存储键名
  static const String storageKeyAuthToken = 'auth_token';
  static const String storageKeyUser = 'user';
  static const String storageKeyTheme = 'theme';
  static const String storageKeyLocale = 'locale';

  // 路由配置
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String mainRoute = '/main';

  // 网络配置
  static const int maxCacheSize = 1024 * 1024 * 10; // 10MB
  static const int imageCacheSize = 1024 * 1024 * 5; // 5MB

  // 分页配置
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // 安全配置
  static const bool enableDebug = true;
  static const bool enableLog = true;

  // 功能开关
  static const bool enableBiometric = true;
  static const bool enablePushNotification = true;
  static const bool enableAnalytics = true;
}
