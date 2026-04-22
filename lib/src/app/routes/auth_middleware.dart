import 'package:flutter/material.dart';
import 'package:flutter_project/src/core/controllers/user_controller.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final UserController userController = Get.find();
    
    if (!userController.isLoggedIn.value) {
      // 记录用户原本想要访问的路由
      Get.toNamed('/login', arguments: route);
      return const RouteSettings(name: '/login');
    }
    
    return null;
  }
}
