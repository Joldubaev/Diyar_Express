part of 'home_features_cubit.dart';

abstract class HomeFeaturesState {}

final class HomeFeaturesInitial extends HomeFeaturesState {}

final class HomeFeaturesLoading extends HomeFeaturesState {}

final class HomeFeaturesLoaded extends HomeFeaturesState {
  final List<NewsModel> news;
  final List<SaleModel> sales;

  HomeFeaturesLoaded({
    required this.news,
    required this.sales,
  });
}

final class HomeFeaturesError extends HomeFeaturesState {
  final String message;

  HomeFeaturesError({
    required this.message,
  });
}
