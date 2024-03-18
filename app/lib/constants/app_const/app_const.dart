import 'package:flutter/material.dart';

class AppConst {
  const AppConst._();

  static const locales = <Locale>[
    Locale('en'),
    Locale('ru'),
    Locale('ky'),
  ];

  static String getName(String code) {
    return switch (code) {
      'en' => 'English',
      'ru' => 'Русский',
      'ky' => 'Кыргыз',
      _ => 'English',
    };
  }

  static bool isLocalSupport(String deviceLocal) {
    return switch (deviceLocal) { 'en' || 'ru' || 'ky' => true, _ => false };
  }

  static const refreshToken = 'REFRESH_TOKEN';
  static const accessToken = 'ACCESS_TOKEN';
  static const langCode = 'LANGUAGE_CODE';
  static const userInfo = 'USER_INFORMATION';
  static const userId = 'USER_ID';
  static const userRole = 'USER_ROLE';
  static const prefs = 'PREFS';
}
