import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:flutter/material.dart';

class CartEmptyWidget extends StatelessWidget {
  const CartEmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/cart.png', width: 200, height: 200),
          const SizedBox(height: 16),
          Text(context.l10n.cartIsEmpty,
              style:
                  theme.textTheme.titleMedium!.copyWith(color: AppColors.grey)),
        ],
      ),
    );
  }
}
