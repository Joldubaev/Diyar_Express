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
    return ProductItemContentWidget(
      onTap: () => showProductDetails(),
    );
  }

  showProductDetails() {
    return showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: Colors.white,
      constraints: const BoxConstraints(
        minHeight: 430,
        maxHeight: 435,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) => const ProductItemContentWidget(
        isShadowVisible: false,
      ),
    );
  }
}
