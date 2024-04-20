import 'package:diyar_express/features/cart/cart.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterWidget extends StatelessWidget {
  final int counter;
  final String id;

  const CounterWidget({super.key, required this.counter, required this.id});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  if (counter > 1) {
                    context.read<CartCubit>().decrementCart(id);
                  } else {
                    context.read<CartCubit>().removeFromCart(id);
                  }
                },
              ),
              Text(counter.toString(), style: theme.textTheme.bodyLarge),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => context.read<CartCubit>().incrementCart(id),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
