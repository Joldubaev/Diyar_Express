import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:diyar_express/constants/constant.dart';
import 'package:diyar_express/core/core.dart';
import 'package:diyar_express/features/auth/data/datasources/local/local.dart';
import 'package:diyar_express/features/auth/data/models/sign_up_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> login(UserModel user);
  Future<void> register(UserModel user);
  // Future<void> confirmEmail(String email, int code);
  Future<void> sendForgotPasswordCodeToEmail(String email);
  // Future<void> confirmResetPassword({
  //   required String email,
  //   required String otpCode,
  //   required String newPassword,
  // });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthLocalDataSource _localDataSource;
  final Dio _dio;

  AuthRemoteDataSourceImpl(this._dio, this._localDataSource);

  // @override
  // Future<void> confirmEmail(String email, int code) async {
  //   try {
  //     var res = await _dio.post("/api/auth/email-confirm/", queryParameters: {
  //       "email": email,
  //       "confirmCode": code,
  //     });

  //     if (res.statusCode != 200) {
  //       throw ServerException();
  //     }
  //   } catch (e) {
  //     log("$e");
  //     throw ServerException();
  //   }
  // }

  // @override
  // Future<void> confirmResetPassword({
  //   required String email,
  //   required String otpCode,
  //   required String newPassword,
  // }) async {
  //   try {
  //     var res = await _dio.post(
  //       "/api/auth/reset-password/",
  //       data: {"email": email, "OTPCode": otpCode, "newPassword": newPassword},
  //     );

  //     if (res.statusCode != 200) {
  //       throw ServerException();
  //     }
  //   } catch (e) {
  //     log("$e");
  //     throw ServerException();
  //   }
  // }

  @override
  Future<void> login(UserModel user) async {
    try {
      var res = await _dio.post(ApiConst.signIn, data: {"email": user.email, "password": user.password});

      if ([200, 201].contains(res.statusCode)) {
        await _localDataSource.setTokenToCache(
          refresh: res.data['refreshToken'],
          access: res.data['accessToken'],
        );
      }
    } catch (e) {
      log("$e");
    }
  }

  @override
  Future<void> register(UserModel user) async {
    try {
      var res = await _dio.post(
        ApiConst.signUp,
        data: user.toJson(),
      );

      if (res.statusCode == 200) {
        await _localDataSource.setTokenToCache(
          refresh: res.data['refreshToken'],
          access: res.data['accessToken'],
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
