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

          return Card(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.grey),
            ),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              separatorBuilder: (context, index) => SizedBox(
                height: 1,
                child: Container(color: AppColors.grey),
              ),
              itemCount: _buildDetailList().length,
              itemBuilder: (context, index) {
                final detail = _buildDetailList()[index];
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(detail.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ))),
                        Expanded(child: Text(detail.value)),
                      ],
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  List<OrderDetailItem> _buildDetailList() {
    return [
      OrderDetailItem(title: context.l10n.orderNumber, value: order.orderNumber.toString()),
      OrderDetailItem(title: context.l10n.name, value: order.userName ?? ""),
      OrderDetailItem(title: context.l10n.yourAddress, value: order.address ?? ""),
      OrderDetailItem(title: context.l10n.phone, value: order.userPhone ?? ""),
      OrderDetailItem(title: 'Время', value: order.timeRequest ?? ""),
      OrderDetailItem(title: context.l10n.entranceNumber, value: order.intercom ?? ""),
      OrderDetailItem(title: context.l10n.houseNumber, value: order.houseNumber ?? ""),
      OrderDetailItem(title: context.l10n.floor, value: order.floor ?? ""),
      OrderDetailItem(title: context.l10n.entrance, value: order.entrance ?? ""),
      OrderDetailItem(title: 'Еда', value: order.foods!.map((e) => e.name).join(', ')),
      OrderDetailItem(title: 'Количество ', value: order.foods!.length.toString()),
      OrderDetailItem(title: context.l10n.dishes, value: "${order.dishesCount}"),
      OrderDetailItem(title: context.l10n.paymentMethod, value: order.paymentMethod ?? ""),
      OrderDetailItem(title: context.l10n.som, value: "${order.price}"),
      OrderDetailItem(title: context.l10n.change, value: "${order.sdacha} сом"),
      OrderDetailItem(title: context.l10n.deliveryPrice, value: "${order.deliveryPrice}"),
      OrderDetailItem(title: context.l10n.comment, value: order.comment ?? ""),
    ];
  }
}

class OrderDetailItem {
  final String title;
  final String value;

  OrderDetailItem({required this.title, required this.value});
}
