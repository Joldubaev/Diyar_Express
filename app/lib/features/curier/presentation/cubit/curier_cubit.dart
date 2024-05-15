import 'package:bloc/bloc.dart';
import 'package:diyar_express/features/curier/curier.dart';
import 'package:meta/meta.dart';

part 'curier_state.dart';

class CurierCubit extends Cubit<CurierState> {
  CurierCubit(this.curierRepository) : super(CurierInitial());

  final CurierRepository curierRepository;

  void getCuriers() async {
    emit(CurierLoading());
    try {
      final curiers = await curierRepository.getCuriers();
      emit(CurierLoaded(curiers));
    } catch (e) {
      emit(CurierError('Error'));
    }
  }

  void getFinishOrder(int orderId) async {
    try {
      await curierRepository.getFinishOrder(orderId);
    } catch (e) {
      emit(CurierError('Error'));
    }
  }
}
