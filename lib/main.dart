import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/core/services/dependency_injection.dart';
import 'src/core/services/localization_service.dart';
import 'src/core/services/theme_service.dart';
import 'src/app/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();

    return Obx(() => GetMaterialApp(
          title: 'Flutter Mall',
          theme: themeService.currentTheme,
          locale: LocalizationService.locale,
          fallbackLocale: LocalizationService.fallbackLocale,
          translations: LocalizationService(),
          initialRoute: AppRoutes.splash,
          getPages: AppRoutes.routes,
        ));
  }
}
