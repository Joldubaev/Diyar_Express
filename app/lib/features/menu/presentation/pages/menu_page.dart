import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/components/product/product_item_widget.dart';
import 'package:diyar_express/features/menu/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const MenuHeaderWidget(),
            const MenuCategoryNameListWidget(),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
                childAspectRatio: 0.72,
                children: List.generate(
                  9,
                  (index) => const ProductItemWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
