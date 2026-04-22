import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'storage_service.dart';
import '../config/theme_config.dart';

class ThemeService {
  final StorageService _storageService;
  final _isDarkMode = false.obs;
  bool _initialized = false;
  final Logger _logger = Logger();

  ThemeService(this._storageService) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    try {
      final isDark = await _storageService.getBool('isDarkMode');
      _isDarkMode.value = isDark ?? false;
      _initialized = true;
    } catch (e) {
      _logger.e('ThemeService initialization failed: $e');
      _isDarkMode.value = false;
      _initialized = true;
    }
  }

  // 获取当前主题
  ThemeData get currentTheme {
    return _isDarkMode.value ? darkTheme : lightTheme;
  }

  // 获取是否为深色模式
  bool get isDarkMode {
    return _isDarkMode.value;
  }

  // 切换主题
  Future<void> toggleTheme() async {
    _isDarkMode.value = !_isDarkMode.value;
    await _saveTheme();
  }

  // 设置为浅色主题
  Future<void> setLightTheme() async {
    _isDarkMode.value = false;
    await _saveTheme();
  }

  // 设置为深色主题
  Future<void> setDarkTheme() async {
    _isDarkMode.value = true;
    await _saveTheme();
  }

  // 保存主题设置
  Future<void> _saveTheme() async {
    await _storageService.setBool('isDarkMode', _isDarkMode.value);
  }

  // 浅色主题
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: ThemeConfig.primaryColor,
      brightness: Brightness.light,
      background: ThemeConfig.lightBackgroundColor,
      onBackground: ThemeConfig.lightTextColor,
      surface: ThemeConfig.lightCardColor,
      onSurface: ThemeConfig.lightTextColor,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: ThemeConfig.lightBackgroundColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: ThemeConfig.lightTextColor),
      bodyMedium: TextStyle(color: ThemeConfig.lightTextColor),
      bodySmall: TextStyle(color: ThemeConfig.lightTextSecondaryColor),
      titleLarge: TextStyle(color: ThemeConfig.lightTextColor),
      titleMedium: TextStyle(color: ThemeConfig.lightTextColor),
      titleSmall: TextStyle(color: ThemeConfig.lightTextColor),
    ),
  );

  // 深色主题
  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: ThemeConfig.primaryColor,
      brightness: Brightness.dark,
      background: ThemeConfig.darkBackgroundColor,
      onBackground: ThemeConfig.darkTextColor,
      surface: ThemeConfig.darkCardColor,
      onSurface: ThemeConfig.darkTextColor,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: ThemeConfig.darkBackgroundColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: ThemeConfig.darkTextColor),
      bodyMedium: TextStyle(color: ThemeConfig.darkTextColor),
      bodySmall: TextStyle(color: ThemeConfig.darkTextSecondaryColor),
      titleLarge: TextStyle(color: ThemeConfig.darkTextColor),
      titleMedium: TextStyle(color: ThemeConfig.darkTextColor),
      titleSmall: TextStyle(color: ThemeConfig.darkTextColor),
    ),
  );

  // 获取当前主题的按钮样式
  ButtonStyle get buttonStyle => _isDarkMode.value ? ThemeConfig.darkButtonStyle : ThemeConfig.lightButtonStyle;

  // 获取当前主题的输入框样式
  InputDecorationTheme get inputDecorationTheme => _isDarkMode.value 
      ? ThemeConfig.darkInputDecorationTheme 
      : ThemeConfig.lightInputDecorationTheme;

  // 获取当前主题的卡片样式
  CardThemeData get cardTheme => _isDarkMode.value ? ThemeConfig.darkCardTheme : ThemeConfig.lightCardTheme;

  // 获取当前主题的应用栏样式
  AppBarTheme get appBarTheme => _isDarkMode.value ? ThemeConfig.darkAppBarTheme : ThemeConfig.lightAppBarTheme;
}
