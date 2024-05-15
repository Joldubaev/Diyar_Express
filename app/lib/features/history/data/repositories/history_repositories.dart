import 'package:diyar_express/features/history/history.dart';

abstract class HistoryRepository {
  Future<OrderActiveItemModel> getOrderItem({required int orderNumber});
  Future<List<ActiveOrderModel>> getActiveOrders();
}

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryReDatasource historyReDatasource;
  HistoryRepositoryImpl(this.historyReDatasource);

  @override
  Future<OrderActiveItemModel> getOrderItem({required int orderNumber}) {
    return historyReDatasource.getOrderItem(num: orderNumber);
  }

  @override
  Future<List<ActiveOrderModel>> getActiveOrders() {
    return historyReDatasource.getActiveOrders();
  }
}
