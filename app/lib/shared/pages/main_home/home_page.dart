import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/core/router/routes.gr.dart';
import 'package:diyar_express/features/cart/data/models/cart_item_model.dart';
import 'package:diyar_express/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/features/profile/presentation/presentation.dart';
import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/cubit/popular_cubit.dart';
import 'package:diyar_express/shared/pages/widgets/custom_widget.dart';
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
  List<FoodModel> menu = [];

  @override
  void initState() {
    context.read<PopularCubit>().getPopularProducts();
    context.read<CartCubit>().getCartItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<PopularCubit, PopularState>(
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset('assets/images/app_logo.png',
                            height: 60, fit: BoxFit.fill, color: AppColors.primary),
                      ),
                      const Divider(color: AppColors.primary, thickness: 1),
                      Text(context.l10n.sales, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      CustomWidget(
                        discount: int.parse('10'),
                        title: '${context.l10n.sale} 10%',
                        description: context.l10n.forAllFood,
                        image: 'assets/images/banner.png',
                        onTap: () => context.router.push(const SaleRoute()),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        context.l10n.popularFood,
                        style: const TextStyle(
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
                            } else if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
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
                      Text(context.l10n.aboutUs, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      CustonClipRectWidget(
                        image: 'assets/images/about.png',
                        onTap: () => context.router.push(const AboutUsRoute()),
                      ),
                      const SizedBox(height: 10),
                      Text(context.l10n.news, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      CustomWidget(
                        discount: 0,
                        title: context.l10n.news,
                        description: context.l10n.lastNews,
                        image: 'assets/images/news.png',
                        onTap: () => context.router.push(const NewsRoute()),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: SettingsTile(
                          icon: Icons.phone,
                          text: context.l10n.contact,
                          onPressed: () => context.router.push(const ContactRoute()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
