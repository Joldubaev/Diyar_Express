import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/core/router/routes.gr.dart';
import 'package:diyar_express/shared/components/tile/active_tile.dart';
import 'package:flutter/material.dart';

class ActiveOrder extends StatelessWidget {
  const ActiveOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: 1,
      itemBuilder: (context, index) {
        return ActiveTile(
          text: 'Детали заказа',
          hasNotification: true,
          onPressed: () {
            context.pushRoute(const OrderDetailRoute());
          },
        );
      },
    );
  }
}
