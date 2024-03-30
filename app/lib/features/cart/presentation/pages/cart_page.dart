import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/app/router/routes.gr.dart';
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
      body: const CartBody(),
      bottomSheet: const CartBottomSheet(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
    return ListView.builder(
      controller: ScrollController(),
      physics: const BouncingScrollPhysics(),
      itemCount: 12,
      itemBuilder: (context, index) {
        return const CartItemWidgets(
          title: 'Курица с картошкой',
          subtitle: '1 кг',
          price: 150,
          counter: 1,
          imageUrl: 'https://i.ibb.co/GkL25DB/ALE-1357-7.png',
        );
      },
    );
  }
}

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.2,
        minHeight: MediaQuery.of(context).size.height * 0.2,
      ),
      onClosing: () {},
      builder: (context) {
        return const TotalPriceWidget(
          price: 450,
          sale: 0,
          dishesPrice: 0,
          totalPrice: 450,
        );
      },
    );
  }
}
