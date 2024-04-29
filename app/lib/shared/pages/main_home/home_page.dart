import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/core/router/routes.gr.dart';
import 'package:diyar_express/features/cart/data/models/cart_item_model.dart';
import 'package:diyar_express/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/features/profile/presentation/presentation.dart';
import 'package:diyar_express/shared/cubit/popular_cubit.dart';
import 'package:diyar_express/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: HomaPageBody()));
  }
}

class HomaPageBody extends StatefulWidget {
  const HomaPageBody({super.key});

  @override
  State<HomaPageBody> createState() => _HomaPageBodyState();
}

class _HomaPageBodyState extends State<HomaPageBody> {
  List<FoodModel> menu = [];

  @override
  void initState() {
    context.read<PopularCubit>().getPopularProducts();
    context.read<CartCubit>().getCartItems();
    super.initState();
  }

  @override
  void dispose() {
    context.read<PopularCubit>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PopularCubit, PopularState>(
        listener: (context, state) {
          if (state is PopularError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.primary,
              ),
            );
          } else if (state is PopularLoaded) {
            menu = state.products;
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset('assets/images/app_logo.png',
                            height: 60, fit: BoxFit.fill, color: AppColors.primary),
                      ),
                      const Divider(color: AppColors.primary, thickness: 1),
                      const Text(
                        'Акции',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      SaleWidget(
                        title: 'Скидка 10%',
                        description: 'На все блюда',
                        image: 'assets/images/banner.png',
                        onTap: () => context.router.push(const SaleRoute()),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Популярные блюда',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 220,
                        child: StreamBuilder<List<CartItemModel>>(
                          stream: context.read<CartCubit>().cart,
                          builder: (context, snapshot) {
                            List cart = [];
                            if (snapshot.hasData) {
                              cart = snapshot.data ?? [];
                            }
                            return ListView.separated(
                              separatorBuilder: (context, index) => const SizedBox(width: 10),
                              scrollDirection: Axis.horizontal,
                              itemCount: menu.length,
                              itemBuilder: (context, index) {
                                final food = menu[index];
                                final cartItem = cart.firstWhere(
                                  (element) => element.food?.id == food.id,
                                  orElse: () => CartItemModel(food: food, quantity: 0),
                                );
                                return SizedBox(
                                  width: 160,
                                  child: ProductItemWidget(
                                    food: food,
                                    quantity: cartItem.quantity ?? 0,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text('О нас', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      CustonClipRectWidget(
                          image: 'assets/images/about.png', onTap: () => context.router.push(const AboutUsRoute())),
                      const SizedBox(height: 10),
                      const Text('Новости', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      SaleWidget(
                          title: 'Новости',
                          description: 'Последние новости',
                          image: 'assets/images/news.png',
                          onTap: () => context.router.push(const NewsRoute())),
                      const SizedBox(height: 20),
                      Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: SettingsTile(
                              icon: Icons.phone,
                              text: 'Контакты',
                              onPressed: () => context.router.push(const ContactRoute()))),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
