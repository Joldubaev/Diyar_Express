import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyActiveOrders extends StatelessWidget {
  const EmptyActiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/active.svg', width: 200, height: 200),
          const SizedBox(height: 20),
          Text(
            context.l10n.notActiveOrders,
            style: const TextStyle(fontSize: 18, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
