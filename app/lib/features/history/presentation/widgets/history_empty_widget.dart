import 'package:diyar_express/l10n/l10n.dart';
import 'package:flutter/material.dart';

class HistoryEmptyWidget extends StatelessWidget {
  const HistoryEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/active.png',
          width: 150,
          height: 150,
        ),
        const SizedBox(height: 20),
        Text(
          context.l10n.noOrders,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          context.l10n.noOrderDescription,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}
