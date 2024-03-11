import 'package:diyar_express/constants/constant.dart';
import 'package:diyar_express/model/auth/user_model.dart';
import 'package:mdc_http/mdc_http.dart';

class AppService {
  AppService({
    required this.client,
  });
  final MdcHttp client;

  Future<Either<UserModel, String>> setUserServer({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    final result = await client.post(ApiConst.signUp, body: {
      'userName': name,
      'email': email,
      'phone': phoneNumber,
      'password': password,
    });
    return result.fold((l) => Left('${l.statusCode}\n${l.failureType.name}\n${l.failureType.message}'), (r) {
      return Right(r);
    });
  }
}
