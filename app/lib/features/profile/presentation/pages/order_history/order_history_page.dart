import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('История заказов', style: theme.textTheme.titleSmall),
      ),
      body: const OrderHistoryBody(),
    );
  }
}

class OrderHistoryBody extends StatefulWidget {
  const OrderHistoryBody({super.key});

  @override
  State<OrderHistoryBody> createState() => _OrderHistoryBodyState();
}

class _OrderHistoryBodyState extends State<OrderHistoryBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Order History',
        style: theme.textTheme.titleSmall,
      ),
    );
  }
}
