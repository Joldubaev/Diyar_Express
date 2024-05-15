import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/core/router/routes.gr.dart';
import 'package:diyar_express/features/order/presentation/widgets/order_stepper.dart';
import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/shared.dart';
import 'package:flutter/material.dart';

class ActiveOrder extends StatelessWidget {
  const ActiveOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: 1,
      itemBuilder: (context, index) {
        return Card(
          child: ExpansionTile(
            shape: const Border(bottom: BorderSide(color: Colors.transparent, width: 0)),
            childrenPadding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
            title: Text(
              '${context.l10n.orderNumber} ',
              style: theme.textTheme.bodyLarge!.copyWith(
                color: AppColors.primary,
              ),
            ),
            children: [
              const OrderStepper(),
              CustomTextButton(
                onPressed: () => context.pushRoute(OrderDetailRoute(orderNumber: '1')),
                textButton: context.l10n.orderDetails,
              ),
            ],
          ),
        );
      },
    );
  }
}
