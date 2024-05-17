part of 'curier_cubit.dart';

@immutable
sealed class CurierState {}

final class CurierInitial extends CurierState {}

final class CurierLoading extends CurierState {}

final class CurierLoaded extends CurierState {
  final List<CurierOrderModel> curiers;

  CurierLoaded(this.curiers);
}

final class CurierError extends CurierState {
  final String message;

  CurierError(this.message);
}
