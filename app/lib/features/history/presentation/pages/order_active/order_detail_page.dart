import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class OrderDetailPage extends StatefulWidget {
  final String orderNumber;
  const OrderDetailPage({super.key, required this.orderNumber});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  ActiveOrderModel activeOrderModel = ActiveOrderModel();

  @override
  void initState() {
    context.read<HistoryCubit>().getOrderItem(orderNumber: widget.orderNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.orderDetails)),
      body: BlocConsumer<HistoryCubit, HistoryState>(
        listener: (context, state) {
          if (state is HistoryError) {
            SnackBarMessage().showErrorSnackBar(
              message: state.message,
              context: context,
            );
          }
        },
        builder: (context, state) {
          if (state is HistoryLoaded) {
            activeOrderModel = state.activeOrders[0];
          } else if (state is HistoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HistoryError) {
            return const Center(child: Text('Error'));
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: 1,
            itemBuilder: (context, index) {
              return _buildOrderDetailItem(context, context.l10n.orderNumber, "${activeOrderModel.order?.orderNumber}");
            },
          );
        },
      ),
    );
  }

  Widget _buildOrderDetailItem(BuildContext context, String label, String value) {
    return ListTile(
      title: Text(label),
      subtitle: Text(value),
    );
  }
}
