import 'package:bloc/bloc.dart';
import 'package:diyar_express/features/history/data/data.dart';
import 'package:meta/meta.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(this.historyRepository) : super(HistoryInitial());

  final HistoryRepository historyRepository;

  void getOrderItem({required String orderNumber}) async {
    emit(HistoryLoading());
    try {
      final activeOrdersMap = await historyRepository.getOrderItem(orderNumber: int.parse(orderNumber));

      final activeOrders = activeOrdersMap.map((e) => e).toList();

      emit(HistoryLoaded(activeOrders: activeOrders, orderNumber: orderNumber));
    } catch (e) {
      emit(HistoryError(message: 'Error'));
    }
  }
}
