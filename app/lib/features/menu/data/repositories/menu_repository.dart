import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/features/menu/data/models/category_model.dart';

abstract class MenuRepository {
  Future<List<CategoryModel>> getProductsWithMenu();
}

class MenuRepositoryImpl implements MenuRepository {
  final MenuRemoteDataSource _remoteDataSource;

  MenuRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<CategoryModel>> getProductsWithMenu() async => _remoteDataSource.getProductsWithMenu();
}
