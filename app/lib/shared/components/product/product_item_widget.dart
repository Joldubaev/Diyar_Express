import 'package:diyar_express/shared/components/product/product_item_content_widget.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/shared/utils/utils.dart';
import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  final FoodModel food;
  const ProductItemWidget({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return ProductItemContentWidget(
      food: food,
      onTap: () => AppBottomSheet.showBottomSheet(
        context,
        ProductItemContentWidget(isShadowVisible: false, food: food),
        backgroundColor: Colors.white,
      ),
    );
  }
}
