import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:flutter/material.dart';

class EmptyCurierOrder extends StatelessWidget {
  const EmptyCurierOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/empty_curier.png', height: 200),
          const SizedBox(height: 10),
          Text(context.l10n.noOrders, style: theme.textTheme.titleSmall),
        ],
      ),
    );
  }
}
