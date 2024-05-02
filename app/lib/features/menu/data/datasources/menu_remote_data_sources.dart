import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:diyar_express/features/menu/menu.dart';
import 'package:diyar_express/shared/constants/constant.dart';
import 'package:diyar_express/core/core.dart';
import 'package:diyar_express/features/menu/data/models/category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MenuRemoteDataSource {
  Future<List<CategoryModel>> getProductsWithMenu({String? query});
  Future<List<FoodModel>> getPopulartFoods();
  Future<List<FoodModel>> searchFoods({String? name});
}

class MenuRemoteDataSourceImpl implements MenuRemoteDataSource {
  final Dio _dio;
  final SharedPreferences _prefs;

  MenuRemoteDataSourceImpl(this._dio, this._prefs);

  @override
  Future<List<CategoryModel>> getProductsWithMenu({String? query}) async {
    try {
      var token = _prefs.getString(AppConst.accessToken) ?? '';

      var res = await _dio.get(
        ApiConst.getCategories,
        options: Options(headers: ApiConst.authMap(token)),
        queryParameters: {if (query != null) 'foodName': query},
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

  @override
  Future<List<FoodModel>> searchFoods({String? name}) async {
    try {
      var token = _prefs.getString(AppConst.accessToken) ?? '';

      var res = await _dio.post(ApiConst.searchFoodsByName,
          options: Options(headers: ApiConst.authMap(token)),
          data: {"foodName": name ?? ""});

      if (res.statusCode == 200) {
        if (res.data != null) {
          List<dynamic> list = res.data;

          return list.map((e) => FoodModel.fromJson(e)).toList();
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

  @override
  Future<List<FoodModel>> getPopulartFoods() async {
    try {
      var token = _prefs.getString(AppConst.accessToken) ?? '';

      var res = await _dio.get(
        ApiConst.getPopularFoods,
        options: Options(
          headers: ApiConst.authMap(token),
        ),
      );

      if (res.statusCode == 200) {
        if (res.data != null) {
          List<dynamic> list = res.data;
          return list.map((e) => FoodModel.fromJson(e)).toList();
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
