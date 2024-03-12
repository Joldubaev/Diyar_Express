import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mdc_http/mdc_http.dart';

typedef TokenProvider = String? Function();
typedef FromJson<T> = T Function(Map<String, dynamic>);

class MdcHttp {
  MdcHttp({http.Client? client, TokenProvider? tokenProvider})
      : _client = client ?? http.Client(),
        _tokenProvider = tokenProvider;

  final http.Client _client;
  final TokenProvider? _tokenProvider;

  Future<http.Response> sampleGet(String url, {Map<String, String>? headers}) async {
    final uri = Uri.parse(url);
    final hd = headers ?? _getRequestHeaders();
    final response = await _client.get(uri, headers: hd);
    return response;
  }

  Future<Either<T, HttpException>> get<T>(String url, {Map<String, String>? headers}) async {
    try {
      final uri = Uri.parse(url);
      final hd = headers ?? _getRequestHeaders();
      final response = await _client.get(uri, headers: hd);
      if (response.statusCode == HttpStatus.ok) return Right(response.decode<T>());
      return Left(_returnErrorResponse(response));
    } catch (e, s) {
      return Left(HttpException(FailureType.unknown, error: e, stackTrace: s));
    }
  }

  Future<Either<T, HttpException>> getType<T>(String url, {required FromJson<T> fromJson}) async {
    try {
      final data = await get<Map<String, dynamic>>(url);
      return data.fold(Left.new, (r) => Right(fromJson(r)));
    } catch (e, s) {
      return Left(HttpException(FailureType.decode, error: e, stackTrace: s));
    }
  }

  Future<Either<List<T>, HttpException>> getTypeList<T>(String url, {required FromJson<T> fromJson}) async {
    try {
      final data = await get<List<dynamic>>(url);
      return data.fold(Left.new, (r) => Right(r.map((e) => fromJson(e as Map<String, dynamic>)).toList()));
    } catch (e, s) {
      return Left(HttpException(FailureType.deserialization, error: e, stackTrace: s));
    }
  }

  Future<Either<T, HttpException>> post<T>(
    String url, {
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    try {
      final uri = Uri.parse(url);
      final hd = headers ?? _getRequestHeaders();
      final response = await _client.post(uri, headers: hd, body: jsonEncode(body));
      if (response.statusCode == 200 || response.statusCode == 201) return Right(response.decode<T>());
      return Left(_returnErrorResponse(response));
    } catch (e, s) {
      return Left(HttpException(FailureType.unknown, error: e, stackTrace: s));
    }
  }

  Future<Either<T, HttpException>> postType<T>(
    String url, {
    required Map<String, dynamic> body,
    required FromJson<T> fromJson,
  }) async {
    try {
      final data = await post<Map<String, dynamic>>(url, body: body);
      return data.fold(Left.new, (r) => Right(fromJson(r)));
    } catch (e, s) {
      return Left(HttpException(FailureType.decode, error: e, stackTrace: s));
    }
  }

  Future<Either<List<T>, HttpException>> postListType<T>(
    String url, {
    required Map<String, dynamic> body,
    required FromJson<T> fromJson,
  }) async {
    try {
      final data = await post<List<dynamic>>(url, body: body);
      return data.fold(Left.new, (r) => Right(r.map((e) => fromJson(e as Map<String, dynamic>)).toList()));
    } catch (e, s) {
      return Left(HttpException(FailureType.decode, error: e, stackTrace: s));
    }
  }

  Future<Either<T, HttpException>> put<T>(String url, {required Map<String, dynamic> body}) async {
    try {
      final uri = Uri.parse(url);
      final headers = _getRequestHeaders();
      final response = await _client.put(uri, headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200 || response.statusCode == 201) return Right(response.decode<T>());
      return Left(_returnErrorResponse(response));
    } catch (e, s) {
      return Left(HttpException(FailureType.unknown, error: e, stackTrace: s));
    }
  }

  Future<Either<T, HttpException>> putType<T>(
    String url, {
    required Map<String, dynamic> body,
    required FromJson<T> fromJson,
  }) async {
    try {
      final data = await put<Map<String, dynamic>>(url, body: body);
      return data.fold(Left.new, (r) => Right(fromJson(r)));
    } catch (e, s) {
      return Left(HttpException(FailureType.decode, error: e, stackTrace: s));
    }
  }

  Future<Either<T, HttpException>> delete<T>(String url) async {
    try {
      final uri = Uri.parse(url);
      final headers = _getRequestHeaders();
      final response = await _client.delete(uri, headers: headers);
      if (response.statusCode == HttpStatus.ok) return Right(response.decode<T>());
      return Left(_returnErrorResponse(response));
    } catch (e, s) {
      return Left(HttpException(FailureType.unknown, error: e, stackTrace: s));
    }
  }

  Future<Either<T, HttpException>> deleteType<T>(String url, {required FromJson<T> fromJson}) async {
    try {
      final data = await delete<Map<String, dynamic>>(url);
      return data.fold(Left.new, (r) => Right(fromJson(r)));
    } catch (e, s) {
      return Left(HttpException(FailureType.decode, error: e, stackTrace: s));
    }
  }

  Map<String, String> _getRequestHeaders() {
    final token = _tokenProvider?.call();
    return <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      HttpHeaders.acceptHeader: ContentType.json.value,
      if (token != null) HttpHeaders.authorizationHeader: 'Bearer $token',
    };
  }

  HttpException _returnErrorResponse(http.Response response) {
    return switch (response.statusCode) {
      400 => HttpException(FailureType.badRequest, statusCode: response.statusCode, error: response.body),
      401 => HttpException(FailureType.noAuthorization, statusCode: response.statusCode, error: response.body),
      403 => HttpException(FailureType.forbidden, statusCode: response.statusCode, error: response.body),
      500 => HttpException(FailureType.internalServer, statusCode: response.statusCode, error: response.body),
      _ => HttpException(FailureType.unknown, error: response.statusCode, statusCode: response.statusCode),
    };
  }
}

extension on http.Response {
  T decode<T>() {
    try {
      return jsonDecode(utf8.decode(bodyBytes)) as T;
    } catch (e, s) {
      throw HttpException(FailureType.decode, error: e, stackTrace: s);
    }
  }
}
