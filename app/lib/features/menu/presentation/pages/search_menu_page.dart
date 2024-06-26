import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/features/cart/cart.dart';
import 'package:diyar_express/features/cart/data/models/models.dart';
import 'package:diyar_express/features/menu/menu.dart';
import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/shared.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SearchMenuPage extends StatefulWidget {
  const SearchMenuPage({super.key});

  @override
  State<SearchMenuPage> createState() => _SearchMenuPageState();
}

class _SearchMenuPageState extends State<SearchMenuPage> {
  List<FoodModel> foods = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.searchMeal, style: Theme.of(context).textTheme.titleSmall),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: context.l10n.search,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search),
                fillColor: AppColors.grey1,
                filled: true,
                contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                constraints: const BoxConstraints(maxHeight: 40),
              ),
              onChanged: (value) {
                EasyDebounce.debounce(
                  'menu-search-debounce',
                  const Duration(milliseconds: 500),
                  () => context.read<MenuCubit>().searchMenu(query: value),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: BlocConsumer<MenuCubit, MenuState>(
              listener: (context, state) {
                if (state is SearchMenuLoaded) {
                  setState(() {
                    foods = state.foods;
                  });
                  context.read<CartCubit>().getCartItems();
                }
              },
              builder: (context, state) {
                if (state is SearchMenuLoaded) {
                  if (state.foods.isEmpty) {
                    return Center(
                      child: Text(
                        context.l10n.notFound,
                        style: const TextStyle(fontSize: 16),
                      ),
                    );
                  }
                } else if (state is SearchMenuLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchMenuFailure) {
                  return Center(child: Text(context.l10n.loadedWrong));
                }

                return foods.isEmpty
                    ? Center(
                        child: Text(
                          context.l10n.searchByNames,
                          style: const TextStyle(fontSize: 16),
                        ),
                      )
                    : StreamBuilder<List<CartItemModel>>(
                        stream: context.read<CartCubit>().cart,
                        builder: (context, snapshot) {
                          List cart = [];
                          if (snapshot.hasData) {
                            cart = snapshot.data ?? [];
                          }
                          return GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            childAspectRatio: 0.72,
                            shrinkWrap: true,
                            children: List.generate(
                              foods.length,
                              (index) {
                                final food = foods[index];
                                final cartItem = cart.firstWhere(
                                  (element) => element.food?.id == food.id,
                                  orElse: () => CartItemModel(food: food, quantity: 0),
                                );
                                return ProductItemWidget(
                                  food: food,
                                  quantity: cartItem.quantity ?? 0,
                                );
                              },
                            ),
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
