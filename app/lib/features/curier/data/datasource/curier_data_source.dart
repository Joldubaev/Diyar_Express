import 'package:dio/dio.dart';
import 'package:diyar_express/features/curier/data/model/curier_model.dart';
import 'package:diyar_express/shared/constants/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CurierDataSource {
  Future<List<CurierOrderModel>> getCuriers();
  Future<void> getFinishOrder(int orderId);
  Future<List<CurierOrderModel>> getCurierHistory();
}

class CurierDataSourceImpl extends CurierDataSource {
  final Dio dio;
  final SharedPreferences prefs;

  CurierDataSourceImpl(this.dio, this.prefs);

  @override
  Future<List<CurierOrderModel>> getCuriers() async {
    try {
      var token = prefs.getString(AppConst.accessToken) ?? '';
      final res = await dio.get(
        ApiConst.getCuriersAllOrder,
        options: Options(
          headers: ApiConst.authMap(token),
        ),
      );
      if ([200, 201].contains(res.statusCode)) {
        return List<CurierOrderModel>.from(
          res.data['orders'].map((x) => CurierOrderModel.fromJson(x)),
        );
      } else {
        throw Exception('Error getting active orders');
      }
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> getFinishOrder(int orderId) async {
    try {
      var token = prefs.getString(AppConst.accessToken) ?? '';
      final res = await dio.post(
        ApiConst.getCuriersFinis,
        options: Options(
          headers: ApiConst.authMap(token),
        ),
        data: {'orderNumber': orderId},
      );
      if ([200, 201].contains(res.statusCode)) {
        return;
      } else {
        throw Exception('Error getting active orders');
      }
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<CurierOrderModel>> getCurierHistory() async {
    try {
      var token = prefs.getString(AppConst.accessToken) ?? '';
      final res = await dio.get(
        ApiConst.getCuriereOrderHistory,
        options: Options(
          headers: ApiConst.authMap(token),
        ),
      );
      if ([200, 201].contains(res.statusCode)) {
        return List<CurierOrderModel>.from(
          res.data['orders'].map((x) => CurierOrderModel.fromJson(x)),
        );
      } else {
        throw Exception('Error getting active orders');
      }
    } catch (e) {
      throw Exception();
    }
  }
}
