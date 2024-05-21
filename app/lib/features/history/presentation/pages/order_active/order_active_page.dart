import 'dart:convert';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/core/router/routes.gr.dart';
import 'package:diyar_express/features/history/data/model/order_status_model.dart';
import 'package:diyar_express/features/history/history.dart';
import 'package:diyar_express/features/order/presentation/widgets/order_stepper.dart';
import 'package:diyar_express/injection_container.dart';
import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';

class ActiveOrderPage extends StatefulWidget {
  const ActiveOrderPage({super.key});

  @override
  State<ActiveOrderPage> createState() => _ActiveOrderPageState();
}

class _ActiveOrderPageState extends State<ActiveOrderPage>
    with AutomaticKeepAliveClientMixin {
  List<ActiveOrderModel> orders = [];
  List<OrderStatusModel> orderStatuses = [];

  @override
  bool get wantKeepAlive => true;

  late final IOWebSocketChannel _channel;

  @override
  void initState() {
    super.initState();
    context.read<HistoryCubit>().getActiveOrders().then((value) {
      var token = sl<SharedPreferences>().getString(AppConst.accessToken);
      if (token == null) return;

      _channel = IOWebSocketChannel.connect(
          'ws://20.55.72.226:8080/ws/get-status-with-websocket?token=$token');
      _channel.stream.listen((message) {
        log('Received message: $message');
        final List<dynamic> data = jsonDecode(message);

        final List<OrderStatusModel> statuses = data
            .map((dynamic json) => OrderStatusModel.fromJson(json))
            .toList();

        setState(() => orderStatuses = statuses);
      });
    });
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (orderStatuses.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        if (state is GetActiveOrdersError) {
          return const Center(child: Text('Ошибка при загрузке данных'));
        } else if (state is GetActiveOrdersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetActiveOrdersLoaded) {
          orders = state.orders;
          if (state.orders.isEmpty) {
            return const Center(child: Text('No orders'));
          }
        }

        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: orders.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            return Card(
              child: ExpansionTile(
                shape: const Border(
                    bottom: BorderSide(color: Colors.transparent, width: 0)),
                childrenPadding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
                title: Text(
                  '${context.l10n.orderNumber} ${orders[index].order?.orderNumber}',
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                children: [
                  OrderStepper(
                    orderStatus: orderStatuses.firstWhere((element) =>
                        element.orderNumber ==
                        orders[index].order?.orderNumber),
                  ),
                  CustomTextButton(
                    onPressed: () => context.pushRoute(
                      OrderDetailRoute(
                        orderNumber: "${orders[index].order?.orderNumber}",
                      ),
                    ),
                    textButton: context.l10n.orderDetails,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
