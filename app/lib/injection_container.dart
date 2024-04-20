import 'package:dio/dio.dart';
import 'package:diyar_express/features/cart/cart.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/features/menu/data/repositories/menu_repository.dart';
import 'package:diyar_express/features/profile/data/data.dart';
import 'package:diyar_express/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/network/network_info.dart';
import 'package:get_it/get_it.dart';

import 'features/cart/data/datasources/cart_remote_data_source.dart';
import 'features/cart/data/repository/cart_repository.dart';
import 'features/profile/data/datasources/user_remote_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
// cubit or bloc
  sl.registerFactory(() => SignUpCubit(sl()));
  sl.registerFactory(() => SignInCubit(sl()));
  sl.registerFactory(() => ProfileCubit(sl()));
  sl.registerFactory(() => MenuCubit(sl()));
  sl.registerFactory(() => CartCubit(sl()));

// AUTH
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl(), sl(), sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(sl()));

// Profile
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(sl(), sl()));
  // sl.registerLazySingleton<UserRepositoryImpl>(() => UserRepositoryImpl(sl()));
  // sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(sl(), sl()));

  // Menu
  sl.registerLazySingleton<MenuRepository>(() => MenuRepositoryImpl(sl()));
  sl.registerLazySingleton<MenuRemoteDataSource>(
      () => MenuRemoteDataSourceImpl(sl(), sl()));

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
