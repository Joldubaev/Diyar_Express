import 'package:diyar_express/features/curier/curier.dart';
import 'package:diyar_express/features/history/history.dart';
import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/components/components.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:diyar_express/shared/utils/fmt/show_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  List<OrderActiveItemModel> orders = [];

  @override
  void initState() {
    context.read<HistoryCubit>().getHistoryOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        if (state is GetHistoryOrdersError) {
          return const EmptyActiveOrders();
        } else if (state is GetHistoryOrdersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetHistoryOrdersLoaded) {
          orders = state.orders;
          if (orders.isEmpty) {
            return const EmptyActiveOrders();
          }
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: orders.length,
          itemBuilder: (context, index) {
            return Card(
              child: ExpansionTile(
                shape: const Border(
                  bottom: BorderSide(color: Colors.transparent, width: 0),
                ),
                childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
                title: Text(
                  context.l10n.orderDetails,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                subtitle: Text(
                  '${context.l10n.orderNumber} ${orders[index].orderNumber}',
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: AppColors.grey),
                ),
                children: [
                  CustomTile(
                    title: '${context.l10n.costOfMeal}:',
                    trailing: '${orders[index].price} сoм',
                  ),
                  CustomTextButton(
                    onPressed: () {
                      AppAlert.showConfirmDialog(
                        context: context,
                        title: context.l10n.orderRepeat,
                        content: Text(context.l10n.orderRepeatText),
                        confirmPressed: () {
                          Navigator.pop(context);
                        },
                      );
                    },
                    textButton: context.l10n.orderRepeat,
                    description: context.l10n.orderCancelText2,
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
