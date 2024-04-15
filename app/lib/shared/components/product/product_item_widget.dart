import 'package:diyar_express/shared/components/product/product_item_content_widget.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/shared/utils/utils.dart';
import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  final FoodModel food;
  final int quantity;
  const ProductItemWidget({super.key, required this.food, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return ProductItemContentWidget(
      food: food,
      quantity: quantity,
      onTap: () => AppBottomSheet.showBottomSheet(
        context,
        ProductItemContentWidget(
          isShadowVisible: false,
          food: food,
          quantity: quantity,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
