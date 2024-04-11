import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/app/router/routes.gr.dart';
import 'package:diyar_express/components/components.dart';
import 'package:diyar_express/features/cart/data/models/models.dart';
import 'package:diyar_express/features/cart/presentation/presentation.dart';
import 'package:diyar_express/features/cart/presentation/widgets/cart_empty_widget.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CartCubit>().getCartItems();

    var cartItems = context.read<CartCubit>().cart;
    List<CartItemModel> cart = [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина', style: theme.textTheme.titleSmall),
        actions: [
          IconButton(
            icon: const Icon(Icons.history, size: 30),
            onPressed: () => context.router.pushAndPopUntil(
              const OrderHistoryRoute(),
              predicate: (_) => false,
            ),
          )
        ],
      ),
      body: StreamBuilder<List<CartItemModel>>(
          stream: cartItems,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData && cart.isEmpty) {
              return const Center(child: CartEmptyWidget());
            }
            if (snapshot.hasData) {
              cart = snapshot.data ?? [];
            }

            List<CartItemModel> carts = snapshot.data!;

            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: carts.length,
                    padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                    itemBuilder: (context, index) {
                      return CartItemWidgets(
                        counter: carts[index].quantity ?? 0,
                        food: carts[index].food ?? FoodModel(),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                    child: TotalPriceWidget(
                      price: carts.fold(
                        0,
                        (previousValue, element) =>
                            previousValue + element.food!.price! * element.quantity!,
                      ),
                      sale: 0,
                      dishesPrice: 0,
                      totalPrice: carts.fold(
                        0,
                        (previousValue, element) =>
                            previousValue + element.food!.price! * element.quantity!,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                    child: SubmitButtonWidget(
                      textStyle: theme.textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                      ),
                      bgColor: AppColors.primary,
                      title: 'Оформить заказ',
                      onTap: () => context.router.pushAndPopUntil(
                        const CreateOrderRoute(),
                        predicate: (_) => false,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          }),
    );
  }
}
