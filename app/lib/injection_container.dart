import 'package:dio/dio.dart';
import 'package:diyar_express/features/cart/cart.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/features/menu/data/repositories/menu_repository.dart';
import 'package:diyar_express/features/profile/data/data.dart';
import 'package:diyar_express/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:diyar_express/shared/cubit/popular_cubit.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/network/network_info.dart';
import 'package:get_it/get_it.dart';

import 'features/cart/data/datasources/cart_remote_data_source.dart';
import 'features/cart/data/repository/cart_repository.dart';
import 'features/home_features/data/data_source/remote_data_source.dart';
import 'features/home_features/data/repositories/home_features_repo.dart';
import 'features/home_features/presentation/cubit/home_features_cubit.dart';
import 'features/profile/data/datasources/user_remote_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
// cubit or bloc
  sl.registerFactory(() => SignUpCubit(sl()));
  sl.registerFactory(() => SignInCubit(sl()));
  sl.registerFactory(() => ProfileCubit(sl()));
  sl.registerFactory(() => MenuCubit(sl()));
  sl.registerFactory(() => CartCubit(sl()));
  sl.registerFactory(() => PopularCubit(sl()));
  sl.registerFactory(() => OrderCubit());
  sl.registerFactory(() => AboutUsCubit(sl()));
  sl.registerFactory(() => HomeFeaturesCubit(sl()));

// AUTH
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(sl(), sl(), sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(sl()));

  // about us
  sl.registerLazySingleton<AboutUsRepository>(() => AboutUsRepositoryImpl(sl()));
  sl.registerLazySingleton<AboutUsRemoteDataSource>(() => AboutUsRemoteDataSourceImpl(sl(), sl()));

// Profile
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));
  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(sl(), sl()));
  // sl.registerLazySingleton<UserRepositoryImpl>(() => UserRepositoryImpl(sl()));
  // sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(sl(), sl()));

  // Menu
  sl.registerLazySingleton<MenuRepository>(() => MenuRepositoryImpl(sl()));
  sl.registerLazySingleton<MenuRemoteDataSource>(() => MenuRemoteDataSourceImpl(sl(), sl()));

  // HomeFeatures
  sl.registerLazySingleton<HomeRemoteDataSource>(() => HomeFeaturesRepositoryImpl(sl()));
  sl.registerLazySingleton<HomeFeaturesRepo>(() => HomeFeaturesRepoImpl(sl()));

  // Cart
  sl.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(sl()));
  sl.registerLazySingleton<CartRemoteDataSource>(() => CartRemoteDataSourceImpl(sl()));

//! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External
  sl.registerLazySingleton(() => InternetConnection());

  final sharedPrefences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPrefences);
  sl.registerLazySingleton(() => Dio());
}
