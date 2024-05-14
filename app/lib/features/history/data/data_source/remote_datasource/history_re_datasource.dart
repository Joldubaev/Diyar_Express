import 'package:dio/dio.dart';
import 'package:diyar_express/features/history/history.dart';
import 'package:diyar_express/shared/constants/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HistoryReDatasource {
  Future<List<ActiveOrderModel>> getOrderItem({required int num});
  // Future<List<OrderOrder>> getHistoryOrders();
}

class HistoryReDatasourceImpl implements HistoryReDatasource {
  SharedPreferences prefs;
  final Dio dio;
  HistoryReDatasourceImpl(this.dio, this.prefs);

  @override
  Future<List<ActiveOrderModel>> getOrderItem({required int num}) async {
    try {
      final response = dio.post(ApiConst.getActiveOrder,
          options: Options(
            headers: ApiConst.authMap(prefs.getString(AppConst.accessToken) ?? ''),
          ),
          data: {
            "orderNumber": num,
          });
      return response.then((value) {
        final List<ActiveOrderModel> activeOrders = [];
        for (final item in value.data) {
          activeOrders.add(ActiveOrderModel.fromJson(item));
        }
        return activeOrders;
      });
    } catch (e) {
      throw Exception();
    }
  }
}
