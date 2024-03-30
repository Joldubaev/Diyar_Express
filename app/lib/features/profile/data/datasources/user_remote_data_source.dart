import 'package:dio/dio.dart';
import 'package:diyar_express/constants/api_const/api_const.dart';
import 'package:diyar_express/constants/app_const/app_const.dart';
import 'package:diyar_express/core/core.dart';
import 'package:diyar_express/features/auth/data/models/user_mpdel.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUser();
  Future<void> updateEmail();
  Future<void> updatePhone();
  Future<void> updateUserName();
  Future<void> deleteUser();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio _dio;
  final SharedPreferences _prefs;

  UserRemoteDataSourceImpl(this._dio, this._prefs);

  @override
  Future<UserModel> getUser() async {
    try {
      var res = await _dio.post(ApiConst.getUser,
          data: {"email": _prefs.getString(AppConst.email)},
          options: Options(headers: {
            "Authorization": "Bearer ${_prefs.getString(AppConst.accessToken)}",
          }));
      if (res.statusCode == 200) {
        return UserModel.fromJson(res.data);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> updateEmail() {
    // TODO: implement updateEmail
    throw UnimplementedError();
  }

  @override
  Future<void> updatePhone() {
    // TODO: implement updatePhone
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserName() {
    // TODO: implement updateUserName
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }
}
