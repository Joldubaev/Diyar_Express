import 'package:diyar_express/components/components.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:diyar_express/utils/fmt/show_alert.dart';
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
              'Детали заказа',
              style: theme.textTheme.bodyLarge!.copyWith(
                color: AppColors.primary,
              ),
            ),
            subtitle: Text(
              '12.12.2021 12:12',
              style: theme.textTheme.bodySmall!.copyWith(color: AppColors.grey),
            ),
            children: [
              const CustomTile(
                title: 'Стоимость блюд:',
                trailing: '100 сoм',
              ),
              // user can copy address from here

              CustomTextButton(
                onPressed: () {
                  AppAlert.showConfirmDialog(
                    context: context,
                    title: 'Повторить заказ',
                    content: const Text('Вы уверены, что хотите повторить заказ?'),
                    confirmPressed: () {
                      Navigator.pop(context);
                    },
                  );
                },
                textButton: 'Повторить заказ',
                description: 'Вы можете отменить заказ только за время до начала приготовления в течении:',
              ),
            ],
          ),
        );
      },
    );
  }
}
