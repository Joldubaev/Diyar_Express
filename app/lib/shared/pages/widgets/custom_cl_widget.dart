import 'package:flutter/material.dart';

class CustonClipRectWidget extends StatelessWidget {
  const CustonClipRectWidget({super.key, required this.image, required this.onTap});
  final String image;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(image, fit: BoxFit.cover, height: 200),
      ),
    );
  }
}
