import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioSetting {
  DioSetting._() {
    setup();
  }

  Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://20.55.72.226:8080",
      contentType: 'application/json',
      headers: {'Accept': 'application/json'},
      connectTimeout: const Duration(seconds: 20000),
      receiveTimeout: const Duration(seconds: 2000),
    ),
  );
  void setup() async {
    final interceptor = dio.interceptors;
    interceptor.clear();

    final logInterceptor = LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    );

    final headerInterceptor = QueuedInterceptorsWrapper(
      onRequest: (options, handler) => handler.next(options),
      onResponse: (response, handler) => handler.next(response),
      onError: (error, handler) => handler.next(error),
    );

    interceptor.addAll([if (kDebugMode) headerInterceptor, logInterceptor]);
  }
}
