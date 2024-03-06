import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    required this.iconPath,
    required this.text,
    required this.margin,
    required this.onPressed,
    super.key,
  });
  final String iconPath;
  final String text;
  final void Function()? onPressed;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade500),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          leading: SvgPicture.asset(
            iconPath,
          ),
          title: Text(text),
        ),
      ),
    );
  }
}
