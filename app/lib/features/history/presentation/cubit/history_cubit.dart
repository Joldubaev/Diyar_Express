import 'package:bloc/bloc.dart';
import 'package:diyar_express/features/history/data/data.dart';
import 'package:meta/meta.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(this.historyRepository) : super(HistoryInitial());

  final HistoryRepository historyRepository;

  void getOrderItem(String orderNumber) async {
    emit(GetOrderItemLoading());
    try {
      final model = await historyRepository.getOrderItem(
        orderNumber: int.parse(orderNumber),
      );
      emit(GetOrderItemLoaded(model));
    } catch (e) {
      emit(GetOrderItemError());
    }
  }

  getActiveOrders() async {
    emit(GetActiveOrdersLoading());
    try {
      final orders = await historyRepository.getActiveOrders();
      emit(GetActiveOrdersLoaded(orders));
    } catch (e) {
      emit(GetActiveOrdersError());
    }
  }
}
