import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/features/order/data/models/pickup_order_model.dart';
import 'package:equatable/equatable.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepository _orderRepository;
  OrderCubit(this._orderRepository) : super(OrderInitial());

  String address = '';
  double deliveryPrice = 0;

  changeAddress(String str) {
    emit(OrderAddressLoading());
    address = str;
    emit(OrderAddressChanged(address: str));
  }

  selectDeliveryPrice(double price) {
    emit(SelectDeliveryPriceLoading());
    deliveryPrice = price;
    emit(SelectDeliveryPriceLoaded(deliveryPrice: price));
  }

  Future createOrder(CreateOrderModel order) async {
    emit(CreateOrderLoading());
    try {
      await _orderRepository.createOrder(order);
      emit(CreateOrderLoaded());
    } catch (e) {
      emit(CreateOrderError());
    }
  }

  Future getPickupOrder(PickupOrderModel order) async {
    emit(CreateOrderLoading());
    try {
      await _orderRepository.getPickupOrder(order);
      log('getPickupOrder success $_orderRepository');
      emit(CreateOrderLoaded());
    } catch (e) {
      emit(CreateOrderError());
    }
  }
}
