part of 'history_cubit.dart';

@immutable
sealed class HistoryState {}

final class HistoryInitial extends HistoryState {}

final class HistoryLoading extends HistoryState {}

final class HistoryLoaded extends HistoryState {
  final List<ActiveOrderModel> activeOrders;
  final String orderNumber;

  HistoryLoaded({required this.activeOrders, required this.orderNumber});
}

final class HistoryError extends HistoryState {
  final String message;

  HistoryError({required this.message});
}
