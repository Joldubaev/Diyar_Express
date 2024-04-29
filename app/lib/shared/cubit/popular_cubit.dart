import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/features/menu/data/repositories/menu_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit(this._menuRepository) : super(PopularInitial());

  final MenuRepository _menuRepository;

  List<FoodModel> popularFoods = [];

  void getPopularProducts() async {
    emit(PopularLoading());
    try {
      final product = await _menuRepository.getPopularFoods();
      popularFoods = product;
      emit(PopularLoaded(product));
    } catch (e) {
      emit(const PopularError('Ошибка загрузки данных'));
    }
  }
}
