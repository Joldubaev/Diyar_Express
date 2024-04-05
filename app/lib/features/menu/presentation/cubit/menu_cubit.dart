import 'package:bloc/bloc.dart';
import 'package:diyar_express/features/menu/data/models/category_model.dart';
import 'package:diyar_express/features/menu/data/repositories/menu_repository.dart';
import 'package:equatable/equatable.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  final MenuRepository _menuRepository;

  MenuCubit(this._menuRepository) : super(MenuInitial());

  List<CategoryModel> menu = [];

  void getProductsWithMenu() async {
    emit(GetMenuLoading());
    try {
      final products = await _menuRepository.getProductsWithMenu();
      menu = products;
      emit(GetMenuLoaded(products));
    } catch (e) {
      emit(GetMenuFailure());
    }
  }
}
