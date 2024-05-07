import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/features/cart/data/models/models.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreateOrderPage extends StatefulWidget {
  final List<CartItemModel> cart;
  final int dishCount;
  const CreateOrderPage(
      {super.key, required this.cart, required this.dishCount});

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Детали заказа', style: TextStyle(fontSize: 16)),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: AppColors.grey.withOpacity(0.2),
              ),
              child: const TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black54,
                tabs: [
                  TabItem(title: 'Доставка'),
                  TabItem(title: 'Самовывоз'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            DeliveryFormPage(cart: widget.cart),
            const PickupForm(),
          ],
        ),
      ),
    );
  }
}
