import 'package:diyar_express/components/product/product_item_content_widget.dart';
import 'package:diyar_express/utils/utils.dart';
import 'package:flutter/material.dart';

class ProductItemWidget extends StatefulWidget {
  const ProductItemWidget({super.key});

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ProductItemContentWidget(
      onTap: () => AppBottomSheet.showBottomSheet(
        context,
        const ProductItemContentWidget(isShadowVisible: false),
        backgroundColor: Colors.white,
      ),
    );
  }
}
