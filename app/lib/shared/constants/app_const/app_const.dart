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

  // Map
  static const getLocations = "6d9fa3b5-2a2b-46fa-838b-ce4e9fc4e4f8";
  static const email = 'email';

  // terms and conditions
  static const terms =
      'https://docs.google.com/document/d/1jww3-H3VeV0l_zYQS7zmlKGzQYwOwFisOb3MaIo5bsQ/edit?usp=sharing';
}
