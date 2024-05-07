import 'package:diyar_express/shared/components/components.dart';
import 'package:diyar_express/features/cart/presentation/presentation.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalPriceWidget extends StatefulWidget {
  const TotalPriceWidget({
    super.key,
    required this.price,
    required this.sale,
    required this.totalPrice,
  });

  final int price;
  final int sale;
  final int totalPrice;

  @override
  State<TotalPriceWidget> createState() => _TotalPriceWidgetState();
}

class _TotalPriceWidgetState extends State<TotalPriceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
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
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          context.read<CartCubit>().changeTotalPrice(
              widget.totalPrice + (context.read<CartCubit>().dishCount * 15));

          return Column(
            children: [
              CustomTile(
                title: 'Стоимость блюд:',
                trailing: '${widget.price} сoм',
              ),
              CustomTile(
                title: 'Посуда:',
                trailing: '${context.read<CartCubit>().dishCount} сoм',
              ),
              CustomTile(
                title: 'Скидка:',
                trailing: '${widget.sale} сoм',
              ),
              const Divider(color: Colors.grey),
              CustomTile(
                title: 'Итого:',
                trailing:
                    '${widget.totalPrice + (context.read<CartCubit>().dishCount * 15)} сoм',
              ),
              Text(
                'Сумма к оплате указана без доставки!',
                style:
                    theme.textTheme.bodySmall!.copyWith(color: AppColors.red),
              ),
              const SizedBox(height: 10),
              const DishesWidget(),
            ],
          );
        },
      ),
    );
  }
}
