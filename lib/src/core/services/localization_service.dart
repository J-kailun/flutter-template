import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'lang/lang_zh.dart';
import 'lang/lang_en.dart';

class LocalizationService extends Translations {
  static final locale = Locale('zh', 'CN');
  static final fallbackLocale = Locale('en', 'US');
  static final supportedLocales = [
    Locale('zh', 'CN'),
    Locale('en', 'US'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': langZh,
        'en_US': langEn,
      };

  // 切换到中文
  static void changeToChinese() {
    Get.updateLocale(const Locale('zh', 'CN'));
  }

  // 切换到英文
  static void changeToEnglish() {
    Get.updateLocale(const Locale('en', 'US'));
  }

  // 切换语言
  static void changeLocale(Locale locale) {
    Get.updateLocale(locale);
  }

  // 获取当前语言代码
  static String get currentLanguageCode {
    return Get.locale?.languageCode ?? 'zh';
  }

  // 检查是否为中文
  static bool get isChinese {
    return Get.locale?.languageCode == 'zh';
  }

  // 检查是否为英文
  static bool get isEnglish {
    return Get.locale?.languageCode == 'en';
  }

  // 切换语言（切换到另一种语言）
  static void toggleLanguage() {
    if (isChinese) {
      changeToEnglish();
    } else {
      changeToChinese();
    }
  }
}

