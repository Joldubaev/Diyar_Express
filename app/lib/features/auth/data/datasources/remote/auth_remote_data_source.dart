import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:diyar_express/constants/constant.dart';
import 'package:diyar_express/core/core.dart';
import 'package:diyar_express/features/auth/data/models/user_mpdel.dart';
import 'package:diyar_express/features/features.dart';

abstract class AuthRemoteDataSource {
  Future<void> login(UserModel user);
  Future<void> register(UserModel user);
  // Future<void> confirmEmail(String email, int code);
  Future<void> sendForgotPasswordCodeToEmail(String email);

  Future<void> confirmResetPassword({required ResetModel model});
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

  @override
  Future<void> confirmResetPassword({
    required ResetModel model,
  }) async {
    try {
      var res = await _dio.post(
        ApiConst.resetPsw,
        data: {
          "email": model.email,
          "code": model.code,
          "newPassword": model.newPassword
        },
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
  Future<void> login(UserModel user) async {
    try {
      var res = await _dio
          .post(ApiConst.signIn, data: {"email": user.email, "password": user.password});

      if ([200, 201].contains(res.statusCode)) {
        await _localDataSource.setTokenToCache(
          refresh: res.data['refreshToken'],
          access: res.data['accessToken'],
          email: user.email!,
        );
      }
    } catch (e) {
      if (e is DioException) {
        throw WrongPasswordException();
      }
      log("$e");
    }
  }

  @override
  Future<void> register(UserModel user) async {
    try {
      var res = await _dio.post(ApiConst.signUp, data: user.toJson());

      if (res.statusCode == 200) {
        await _localDataSource.setTokenToCache(
          refresh: res.data['refreshToken'],
          access: res.data['accessToken'],
          email: user.email!,
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
        ApiConst.sendCodeToEmail,
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
