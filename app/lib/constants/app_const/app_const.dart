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
}
