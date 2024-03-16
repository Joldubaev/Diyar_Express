import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:diyar_express/core/core.dart';
import 'package:diyar_express/features/auth/data/datasources/local/local.dart';

abstract class AuthRemoteDataSource {
  Future<void> login(String user);
  Future<void> register(String user);
  Future<void> confirmEmail(String email, int code);
  Future<void> sendForgotPasswordCodeToEmail(String email);
  Future<void> confirmResetPassword({
    required String email,
    required String otpCode,
    required String newPassword,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthLocalDataSource _localDataSource;
  final Dio _dio;

  AuthRemoteDataSourceImpl(this._dio, this._localDataSource);

  @override
  Future<void> confirmEmail(String email, int code) async {
    try {
      var res = await _dio.post("/api/auth/email-confirm/", queryParameters: {
        "email": email,
        "confirmCode": code,
      });

      if (res.statusCode != 200) {
        throw ServerException();
      }
    } catch (e) {
      log("$e");
      throw ServerException();
    }
  }

  @override
  Future<void> confirmResetPassword({
    required String email,
    required String otpCode,
    required String newPassword,
  }) async {
    try {
      var res = await _dio.post(
        "/api/auth/reset-password/",
        data: {"email": email, "OTPCode": otpCode, "newPassword": newPassword},
      );

      if (res.statusCode != 200) {
        throw ServerException();
      }
    } catch (e) {
      log("$e");
      throw ServerException();
    }
  }

  @override
  Future<void> login(String user) async {
    try {
      var res = await _dio.post(
        "/api/auth/sign-in/",
        // data: {"email": user.email, "password": user.password},
      );

      if (res.statusCode == 200) {
        await _localDataSource.setTokenToCache(
          refresh: res.data['refresh'],
          access: res.data['access'],
        );
      }
    } catch (e) {
      log("$e");
      throw ServerException();
    }
  }

  @override
  Future<void> register(String user) async {
    try {
      var res = await _dio.post(
        "/api/auth/sign-up/",
        // data: user.toJson(),
      );

      if (res.statusCode == 200) {
        await _localDataSource.setTokenToCache(
          refresh: res.data['refresh'],
          access: res.data['access'],
        );
      }
    } catch (e) {
      log("$e");
      throw ServerException();
    }
  }

  @override
  Future<void> sendForgotPasswordCodeToEmail(String email) async {
    try {
      var res = await _dio.post(
        "/api/auth/forgot-password/",
        data: {"email": email},
      );

      if (res.statusCode != 200) {
        throw ServerException();
      }
    } catch (e) {
      log("$e");
      throw ServerException();
    }
  }
}
