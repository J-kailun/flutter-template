import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:logger/logger.dart';

class CommonUtils {
  static final Logger _logger = Logger();

  static String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  static String formatPrice(double price) {
    return '¥${price.toStringAsFixed(2)}';
  }

  static String formatDateTime(DateTime dateTime) {
    return '${dateTime.year}-${_twoDigits(dateTime.month)}-${_twoDigits(dateTime.day)} ${_twoDigits(dateTime.hour)}:${_twoDigits(dateTime.minute)}';
  }

  static String _twoDigits(int n) {
    return n.toString().padLeft(2, '0');
  }

  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    return emailRegex.hasMatch(email);
  }

  static bool isValidPhone(String phone) {
    final phoneRegex = RegExp(r'^1[3-9]\d{9}$');
    return phoneRegex.hasMatch(phone);
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  static T? safeCast<T>(dynamic value) {
    try {
      return value as T;
    } catch (e) {
      _logger.e('Safe cast failed: $e');
      return null;
    }
  }
}
