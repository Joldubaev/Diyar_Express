import 'package:diyar_express/features/home_features/data/data_source/remote_data_source.dart';
import 'package:diyar_express/features/home_features/data/model/news_model.dart';
import 'package:diyar_express/features/home_features/data/model/sale_model.dart';

abstract class HomeFeaturesRepo {
  Future<List<NewsModel>> getNews();
  Future<List<SaleModel>> getSales();
}

class HomeFeaturesRepoImpl implements HomeFeaturesRepo {
  final HomeRemoteDataSource remoteDataSource;

  HomeFeaturesRepoImpl(this.remoteDataSource);

  @override
  Future<List<NewsModel>> getNews() async {
    return remoteDataSource.getNews();
  }

  @override
  Future<List<SaleModel>> getSales() async {
    return remoteDataSource.getSales();
  }
}
