import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/constants/application/application.dart';

class AppLocalizationHelper {
  static List<Locale> localList = [tr, en, fr, de];
  static const Locale tr = Locale("tr");
  static const Locale en = Locale("en");
  static const Locale fr = Locale("fr");
  static const Locale de = Locale("de");
  static const String path = 'assets/i18n';
  static Locale currentLocale = tr;

  static Future<void> initialize() async {
    Locale locale = Application.applicationContext.locale;

    if (localList.contains(locale)) {
      currentLocale = locale;
    }
  }

  static Future<void> changeLocale({required Locale locale}) async {
    currentLocale = locale;
    await Application.applicationContext.setLocale(currentLocale);
  }
}
