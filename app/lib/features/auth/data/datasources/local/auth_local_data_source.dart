import 'dart:convert';

import 'package:diyar_express/app/models/token_model.dart';
import 'package:diyar_express/constants/constant.dart';
import 'package:diyar_express/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<String?> getLangFromCache();
  Future<void> logout();
  Future<void> setLangToCache(String langCode);
  Future<void> setUserToCache(TokenModel user);
  String? getUserFromCache();
  Future<void> setTokenToCache({
    required String refresh,
    required String access,
  });
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences prefs;

  AuthLocalDataSourceImpl(this.prefs);

  @override
  Future<String?> getLangFromCache() async {
    return prefs.getString(AppConst.langCode);
  }

  @override
  Future<void> logout() async {
    try {
      await prefs.remove(AppConst.refreshToken);
      await prefs.remove(AppConst.accessToken);
      await prefs.remove(AppConst.langCode);
      await prefs.remove(AppConst.userInfo);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> setLangToCache(String langCode) async {
    try {
      await prefs.setString(AppConst.langCode, langCode);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> setTokenToCache({
    required String refresh,
    required String access,
  }) async {
    try {
      await prefs.setString(AppConst.refreshToken, refresh);
      await prefs.setString(AppConst.accessToken, access);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> setUserToCache(TokenModel user) async {
    try {
      var userString = user.toJson();
      await prefs.setString(AppConst.userInfo, jsonEncode(userString));
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  String? getUserFromCache() {
    try {
      var jsonUser = prefs.getString(AppConst.userInfo);
      if (jsonUser != null) {
        return TokenModel.fromJson(jsonDecode(jsonUser)).role;
      }
      return null;
    } catch (e) {
      throw CacheException();
    }
  }
}
