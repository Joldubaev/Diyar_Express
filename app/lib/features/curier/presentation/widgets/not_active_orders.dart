import 'package:diyar_express/theme/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyActiveOrders extends StatelessWidget {
  const EmptyActiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.local_shipping, size: 100, color: AppColors.primary),
          SizedBox(height: 20),
          Text(
            'У вас нет активных заказов',
            style: TextStyle(fontSize: 18, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
