import 'package:bloc/bloc.dart';
import 'package:diyar_express/features/home_features/data/model/news_model.dart';
import 'package:diyar_express/features/home_features/data/model/sale_model.dart';
import 'package:diyar_express/features/home_features/data/repositories/home_features_repo.dart';

part 'home_features_state.dart';

class HomeFeaturesCubit extends Cubit<HomeFeaturesState> {
  HomeFeaturesCubit(this.homeFeaturesRepo) : super(HomeFeaturesInitial());

  final HomeFeaturesRepo homeFeaturesRepo;

  Future<void> getHomeFeatures() async {
    emit(HomeFeaturesLoading());
    try {
      final news = await homeFeaturesRepo.getNews();
      final sales = await homeFeaturesRepo.getSales();
      emit(HomeFeaturesLoaded(news: news, sales: sales));
    } catch (e) {
      emit(HomeFeaturesError(message: e.toString()));
    }
  }
}
