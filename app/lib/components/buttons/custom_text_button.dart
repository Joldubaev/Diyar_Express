import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.textButton,
    this.onPressed,
    this.time,
    this.description,
  });

  final String textButton;
  final String? description;
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
            '$description $time',
            style: theme.textTheme.bodySmall,
          ),
          TextButton(onPressed: onPressed, child: Text(textButton)),
        ],
      ),
    );
  }
}
