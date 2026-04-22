import 'package:flutter/material.dart';

class ThemeConfig {
  // 主色调
  static const primaryColor = Colors.deepPurple;
  static const secondaryColor = Colors.pinkAccent;
  
  // 背景色
  static const lightBackgroundColor = Color(0xFFFFFFFF);
  static const darkBackgroundColor = Color(0xFF121212);
  
  // 文字颜色
  static const lightTextColor = Color(0xFF333333);
  static const darkTextColor = Color(0xFFE0E0E0);
  static const lightTextSecondaryColor = Color(0xFF666666);
  static const darkTextSecondaryColor = Color(0xFF9E9E9E);
  
  // 边框颜色
  static const lightBorderColor = Color(0xFFE0E0E0);
  static const darkBorderColor = Color(0xFF333333);
  
  // 卡片颜色
  static const lightCardColor = Color(0xFFFFFFFF);
  static const darkCardColor = Color(0xFF1E1E1E);
  
  // 按钮样式
  static ButtonStyle get lightButtonStyle => ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      );
  
  static ButtonStyle get darkButtonStyle => ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      );
  
  // 输入框样式
  static InputDecorationTheme get lightInputDecorationTheme => InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: lightBorderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: lightBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        hintStyle: const TextStyle(color: lightTextSecondaryColor),
      );
  
  static InputDecorationTheme get darkInputDecorationTheme => InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: darkBorderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: darkBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        filled: true,
        fillColor: const Color(0xFF2C2C2C),
        hintStyle: const TextStyle(color: darkTextSecondaryColor),
      );
  
  // 卡片样式
  static CardThemeData get lightCardTheme => CardThemeData(
        color: lightCardColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      );
  
  static CardThemeData get darkCardTheme => CardThemeData(
        color: darkCardColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      );
  
  // 应用栏样式
  static AppBarTheme get lightAppBarTheme => AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
        ),
      );
  
  static AppBarTheme get darkAppBarTheme => AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
        ),
      );
}
