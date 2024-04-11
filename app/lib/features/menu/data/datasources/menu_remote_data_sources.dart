import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:diyar_express/constants/constant.dart';
import 'package:diyar_express/core/core.dart';
import 'package:diyar_express/features/menu/data/models/category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MenuRemoteDataSource {
  Future<List<CategoryModel>> getProductsWithMenu();
}

class MenuRemoteDataSourceImpl implements MenuRemoteDataSource {
  final Dio _dio;
  final SharedPreferences _prefs;

  MenuRemoteDataSourceImpl(this._dio, this._prefs);

  @override
  Future<List<CategoryModel>> getProductsWithMenu() async {
    try {
      var token = _prefs.getString(AppConst.accessToken) ?? '';

      var res = await _dio.get(
        ApiConst.getCategories,
        options: Options(headers: ApiConst.authMap(token)),
      );

      if (res.statusCode == 200) {
        if (res.data != null) {
          List<dynamic> list = res.data;

          return list.map((e) => CategoryModel.fromJson(e)).toList();
        }
        return [];
      } else {
        throw ServerException();
      }
    } catch (e) {
      log("Error: $e");
      throw ServerException();
    }
  }
}
