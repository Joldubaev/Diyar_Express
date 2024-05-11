import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          SvgPicture.asset('assets/icons/cart_icon.svg',
              height: 60, colorFilter: const ColorFilter.mode(AppColors.grey, BlendMode.srcIn)),
          Text(context.l10n.cartIsEmpty, style: const TextStyle(fontSize: 16, color: AppColors.grey)),
        ],
      ),
    );
  }
}
