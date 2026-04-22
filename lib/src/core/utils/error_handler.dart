import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ErrorHandler {
  static final Logger _logger = Logger();

  static void handleError(dynamic error, StackTrace? stackTrace) {
    _logger.e('Error occurred:', error: error, stackTrace: stackTrace);
    
    // 显示错误提示
    Get.snackbar(
      '错误',
      _getErrorMessage(error),
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static String _getErrorMessage(dynamic error) {
    if (error is String) {
      return error;
    } else if (error is Exception) {
      return error.toString();
    } else {
      return '发生未知错误';
    }
  }

  static void handleApiError(dynamic error) {
    _logger.e('API Error:', error: error);
    
    String message = '网络请求失败';
    
    if (error is Map && error.containsKey('message')) {
      message = error['message'];
    } else if (error is String) {
      message = error;
    }
    
    Get.snackbar(
      '请求失败',
      message,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void showSuccess(String message) {
    Get.snackbar(
      '成功',
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void showInfo(String message) {
    Get.snackbar(
      '提示',
      message,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void showWarning(String message) {
    Get.snackbar(
      '警告',
      message,
      backgroundColor: Colors.yellow,
      colorText: Colors.black,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
