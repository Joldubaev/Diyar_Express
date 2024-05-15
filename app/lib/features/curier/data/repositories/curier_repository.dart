import 'package:diyar_express/features/curier/curier.dart';

abstract class CurierRepository {
  Future<List<CurierOrderModel>> getCuriers();
  Future<void> getFinishOrder(int orderId);
}

class CurierRepositoryImpl extends CurierRepository {
  final CurierDataSource dataSource;

  CurierRepositoryImpl(this.dataSource);

  @override
  Future<List<CurierOrderModel>> getCuriers() async {
    return await dataSource.getCuriers();
  }

  @override
  Future<void> getFinishOrder(int orderId) async {
    return await dataSource.getFinishOrder(orderId);
  }
}
