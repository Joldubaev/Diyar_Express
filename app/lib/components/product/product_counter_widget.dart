import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';

class ProductCounterWidget extends StatelessWidget {
  final bool? isShadowVisible;
  final int? count;
  const ProductCounterWidget({super.key, this.isShadowVisible = true, this.count = 0});

  @override
  Widget build(BuildContext context) {
    return count == 0
        ? SizedBox(
            height: 35,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.primaryAccent,
              ),
              icon: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
                size: 20,
              ),
              label: Text(
                'Add to cart',
                style: theme.textTheme.bodySmall!.copyWith(color: Colors.white),
              ),
            ),
          )
        : Container(
            width: double.infinity,
            height: 35,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: isShadowVisible! ? MainAxisSize.max : MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Icon(Icons.remove),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Text('1', style: theme.textTheme.bodyMedium),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          );
  }
}
