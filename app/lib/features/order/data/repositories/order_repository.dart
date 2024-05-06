import 'package:diyar_express/features/order/order.dart';

abstract class OrderRepository {
  Future<List<String>> getOrderHistory();
  Future<void> createOrder(OrderModel order);
}