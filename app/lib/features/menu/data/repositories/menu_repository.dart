import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/features/menu/data/models/category_model.dart';

abstract class MenuRepository {
  Future<List<CategoryModel>> getProductsWithMenu();
  Future<List<FoodModel>> searchFoods({String? name});
  Future<List<FoodModel>> getPopularFoods();
}

class MenuRepositoryImpl implements MenuRepository {
  final MenuRemoteDataSource _remoteDataSource;

  MenuRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<CategoryModel>> getProductsWithMenu() async => _remoteDataSource.getProductsWithMenu();

  @override
  Future<List<FoodModel>> searchFoods({String? name}) async => await _remoteDataSource.searchFoods(name: name);

  @override
  Future<List<FoodModel>> getPopularFoods() async => await _remoteDataSource.getPopulartFoods();
}
