import 'package:diyar_express/components/components.dart';
import 'package:diyar_express/features/cart/presentation/presentation.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({
    super.key,
    required this.price,
    required this.sale,
    required this.dishesPrice,
    required this.totalPrice,
  });

  final int price;
  final int sale;
  final int dishesPrice;
  final int totalPrice;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          CustomTile(
            title: 'Стоимость блюд:',
            trailing: '$price сoм',
          ),
          CustomTile(
            title: 'Посуда:',
            trailing: '$dishesPrice сoм',
          ),
          CustomTile(
            title: 'Скидка:',
            trailing: '$sale сoм',
          ),
          const Divider(
            color: Colors.grey,
          ),
          CustomTile(
            title: 'Итого:',
            trailing: '$totalPrice сoм',
          ),
          Text(
            'Сумма к оплате указана без доставки!',
            style: theme.textTheme.bodySmall!.copyWith(color: AppColors.red),
          ),
          const DishesWidget(),
        ],
      ),
    );
  }
}
