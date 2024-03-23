import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/components/components.dart';
import 'package:diyar_express/features/cart/presentation/presentation.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Корзина'),
          centerTitle: true,
          actions: [IconButton(icon: const Icon(Icons.history, size: 30), onPressed: () {})]),
      body: const CartBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: SubmitButtonWidget(
          textStyle: theme.textTheme.bodyLarge!.copyWith(
            color: Colors.white,
          ),
          bgColor: AppColors.primary,
          title: 'Перейти к покупкам',
          onTap: () {},
        ),
      ),
    );
  }
}

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ScrollableForm(
        formKey: formKey,
        listViewChildren: const [
          CartItemWidgets(
            title: 'Курица с картошкой',
            subtitle: '1 кг',
            price: 150,
            counter: 1,
            imageUrl: 'https://i.ibb.co/GkL25DB/ALE-1357-7.png',
          ),
          CartItemWidgets(
            title: 'Курица с картошкой',
            subtitle: '1 кг',
            price: 150,
            counter: 1,
            imageUrl: 'https://i.ibb.co/GkL25DB/ALE-1357-7.png',
          ),
          CartItemWidgets(
            title: 'Курица с картошкой',
            subtitle: '1 кг',
            price: 150,
            counter: 1,
            imageUrl: 'https://i.ibb.co/GkL25DB/ALE-1357-7.png',
          ),
        ],
        columnChildren: const [
          TotalPriceWidget(
            price: 450,
            sale: 0,
            dishesPrice: 0,
            totalPrice: 450,
          ),
        ],
      ),
    );
  }
}
