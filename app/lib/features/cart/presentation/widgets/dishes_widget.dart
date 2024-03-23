import 'package:diyar_express/features/cart/presentation/presentation.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DishesWidget extends StatelessWidget {
  const DishesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/icons/menu_icon.svg', height: 30),
              Text(
                'Столовые приборы',
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: AppColors.primary,
                ),
              ),
              const CounterWidget(counter: 1),
            ],
          ),
        ));
  }
}
