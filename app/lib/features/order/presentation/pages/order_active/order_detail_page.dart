import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/components/components.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:diyar_express/utils/fmt/show_alert.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Заказы'),
      ),
      body: const OrderActiveCard(),
    );
  }
}

class OrderActiveCard extends StatefulWidget {
  const OrderActiveCard({super.key});

  @override
  State<OrderActiveCard> createState() => _OrderActiveCardState();
}

class _OrderActiveCardState extends State<OrderActiveCard> {
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
              'Номер заказа: 123',
              style: theme.textTheme.bodyLarge!.copyWith(
                color: AppColors.primary,
              ),
            ),
            subtitle: Text(
              '12.12.2021 12:12',
              style: theme.textTheme.bodySmall!.copyWith(color: AppColors.grey),
            ),
            children: [
              const OrderStepper(),
              Divider(
                color: Colors.grey.withOpacity(0.7),
              ),
              const CustomTile(
                title: 'Стоимость блюд:',
                trailing: '100 сoм',
              ),
              CustomTextButton(
                onPressed: () {
                  AppAlert.showConfirmDialog(
                    context: context,
                    title: 'Отменить заказ',
                    content: const Text('Вы уверены, что хотите отменить заказ?'),
                    confirmPressed: () {
                      Navigator.pop(context);
                    },
                  );
                },
                textButton: 'Отменить заказ',
              ),
            ],
          ),
        );
      },
    );
  }
}
