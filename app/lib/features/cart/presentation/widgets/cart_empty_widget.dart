import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartEmptyWidget extends StatelessWidget {
  const CartEmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/cart_icon.svg', height: 60),
          const Text('Ваша корзина пуста'),
        ],
      ),
    );
  }
}
