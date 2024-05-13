import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/components/components.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:diyar_express/shared/utils/fmt/show_alert.dart';
import 'package:flutter/material.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: 1,
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
              '12.12.2021 12:12',
              style: theme.textTheme.bodySmall!.copyWith(color: AppColors.grey),
            ),
            children: [
              CustomTile(
                title: '${context.l10n.costOfMeal}:',
                trailing: '100 сoм',
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
  }
}
