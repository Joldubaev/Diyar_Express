import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/core/router/routes.gr.dart';
import 'package:diyar_express/shared/components/components.dart';
import 'package:diyar_express/features/cart/data/models/models.dart';
import 'package:diyar_express/features/cart/presentation/presentation.dart';
import 'package:diyar_express/features/cart/presentation/widgets/cart_empty_widget.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CartCubit>().getCartItems();

    var cartItems = context.read<CartCubit>().cart;
    List<CartItemModel> carts = [];
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина', style: theme.textTheme.titleSmall),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.history, size: 30),
            onPressed: () => context.pushRoute(const OrderHistoryRoute()),
          )
        ],
      ),
      body: StreamBuilder<List<CartItemModel>>(
          stream: cartItems,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              carts = snapshot.data!;

              return carts.isEmpty
                  ? const CartEmptyWidget()
                  : SingleChildScrollView(
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
                                (previousValue, element) => previousValue + element.food!.price! * element.quantity!,
                              ),
                              sale: 0,
                              totalPrice: carts.fold(
                                0,
                                (previousValue, element) => previousValue + element.food!.price! * element.quantity!,
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
                              onTap: () => context.pushRoute( CreateOrderRoute(
                                cart: carts,
                                dishCount: context.read<CartCubit>().dishCount,
                              )),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    );
            }

            return const CartEmptyWidget();
          }),
    );
  }
}
