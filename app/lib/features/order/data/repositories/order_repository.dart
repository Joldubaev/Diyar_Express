import 'package:diyar_express/features/order/data/datasources/order_remote_datasource.dart';
import 'package:diyar_express/features/order/order.dart';

abstract class OrderRepository {
  Future<List<String>> getOrderHistory();
  Future<void> createOrder(CreateOrderModel order);
}

class OrderRepositoryImpl extends OrderRepository {
  final OrderRemoteDataSource _orderDataSource;

  OrderRepositoryImpl(this._orderDataSource);

  @override
  Future<List<String>> getOrderHistory() async {
    return _orderDataSource.getOrderHistory();
  }

  @override
  Future<void> createOrder(CreateOrderModel order) async {
    return _orderDataSource.createOrder(order);
  }
}