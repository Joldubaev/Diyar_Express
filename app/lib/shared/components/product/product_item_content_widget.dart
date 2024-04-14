import 'package:cached_network_image/cached_network_image.dart';
import 'package:diyar_express/features/cart/data/models/models.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/shared/components/product/product.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItemContentWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final bool? isShadowVisible;
  final FoodModel food;

  const ProductItemContentWidget({
    super.key,
    this.onTap,
    this.isShadowVisible = true,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    context.read<CartCubit>().getCartItems();

    var cartItems = context.read<CartCubit>().cart;
    CartItemModel? cart;

    return StreamBuilder<List<CartItemModel>>(
        stream: cartItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            cart = snapshot.data?.where((e) => e.food!.id == food.id).first;
          }
          return DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: isShadowVisible!
                  ? [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 0),
                      )
                    ]
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6, top: 0),
                      child: CachedNetworkImage(
                        imageUrl: food.urlPhoto ?? 'https://i.ibb.co/GkL25DB/ALE-1357-7.png',
                        errorWidget: (context, url, error) => Image.asset(
                          'assets/images/app_logo.png',
                          color: Colors.grey,
                        ),
                        width: double.infinity,
                        height: 120,
                        placeholder: (context, url) => const Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                  child: Text(
                    '${food.name}',
                    style: theme.textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                  child: RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: '${food.weight}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: ' - ${food.price} сом',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ProductCounterWidget(
                  isShadowVisible: isShadowVisible,
                  count: cart?.quantity ?? 0,
                  id: food.id!,
                  onAddToCart: () {
                    context.read<CartCubit>().addToCart(CartItemModel(food: food, quantity: 1));
                  },
                ),
                const SizedBox(height: 7),
              ],
            ),
          );
        });
  }
}
