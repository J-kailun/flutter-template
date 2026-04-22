import 'package:get/get.dart';
import '../services/localization_service.dart';

class Trans {
  static String t(String key, {Map<String, String>? params}) {
    return key.tr;
  }

  static void toChinese() {
    LocalizationService.changeToChinese();
  }

  static void toEnglish() {
    LocalizationService.changeToEnglish();
  }

  static void toggle() {
    LocalizationService.toggleLanguage();
  }

  static String get currentLanguageCode {
    return LocalizationService.currentLanguageCode;
  }

  static bool get isChinese {
    return LocalizationService.isChinese;
  }

  static bool get isEnglish {
    return LocalizationService.isEnglish;
  }
}
