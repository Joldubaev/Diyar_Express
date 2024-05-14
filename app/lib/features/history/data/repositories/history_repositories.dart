import 'package:diyar_express/features/history/history.dart';

abstract class HistoryRepository {
  Future<List<ActiveOrderModel>> getOrderItem({required int orderNumber});
  // Future<List<OrderOrder>> getHistoryOrders();
}

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryReDatasource historyReDatasource;
  HistoryRepositoryImpl(this.historyReDatasource);

  @override
  Future<List<ActiveOrderModel>> getOrderItem({required int orderNumber}) {
    return historyReDatasource.getOrderItem(num: orderNumber);
  }
}
