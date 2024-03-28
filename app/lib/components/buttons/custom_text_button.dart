import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.textButton,
    this.onPressed,
    this.time,
  });

  final String textButton;
  final DateTime? time;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          const Divider(color: Colors.grey),
          Text(
            'Вы можете отменить заказ только за время до начала приготовления в течении: $time',
            style: theme.textTheme.bodySmall,
          ),
          TextButton(onPressed: onPressed, child: Text(textButton)),
        ],
      ),
    );
  }
}
