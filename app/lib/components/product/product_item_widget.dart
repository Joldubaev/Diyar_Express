import 'package:diyar_express/components/product/product_item_content_widget.dart';
import 'package:flutter/material.dart';

class ProductItemWidget extends StatefulWidget {
  const ProductItemWidget({super.key});

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return const ProductItemContentWidget();
  }

  showProductDetails() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          color: Colors.white,
          child: const ProductItemContentWidget(),
        );
      },
    );
  }
}
