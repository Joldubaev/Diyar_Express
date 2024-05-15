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
  late OrderActiveItemModel order;

  @override
  void initState() {
    context.read<HistoryCubit>().getOrderItem(widget.orderNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.orderDetails)),
      body: BlocConsumer<HistoryCubit, HistoryState>(
        listener: (context, state) {
          if (state is GetOrderItemError) {
            SnackBarMessage().showErrorSnackBar(
              message: "Ошибка при загрузке данных",
              context: context,
            );
          }
        },
        builder: (context, state) {
          if (state is GetOrderItemLoaded) {
            order = state.order;
          } else if (state is GetOrderItemLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetOrderItemError) {
            return const Center(child: Text('Error'));
          }

          return ListTile(
            title: Text(context.l10n.orderNumber),
            subtitle: Text(order.orderNumber.toString()),
          );
        },
      ),
    );
  }
}
