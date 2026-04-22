import 'package:get/get.dart';
import 'package:logger/logger.dart';

class NavigationService {
  final Logger _logger = Logger();

  Future<T?> navigateTo<T>(String route, {dynamic arguments}) async {
    _logger.d('Navigating to: $route with arguments: $arguments');
    return await Get.toNamed<T>(route, arguments: arguments);
  }

  Future<T?> replaceWith<T>(String route, {dynamic arguments}) async {
    _logger.d('Replacing with: $route with arguments: $arguments');
    return await Get.offNamed<T>(route, arguments: arguments);
  }

  Future<T?> navigateAndRemoveUntil<T>(String route, {dynamic arguments}) async {
    _logger.d('Navigating and removing until: $route with arguments: $arguments');
    return await Get.offAllNamed<T>(route, arguments: arguments);
  }

  void goBack<T>({T? result}) {
    _logger.d('Going back with result: $result');
    Get.back<T>(result: result);
  }

  void popUntil(String route) {
    _logger.d('Popping until: $route');
    Get.until((route) => route.settings.name == route);
  }

  String? get currentRoute {
    return Get.currentRoute;
  }

  dynamic get arguments {
    return Get.arguments;
  }
}
