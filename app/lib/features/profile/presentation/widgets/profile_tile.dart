import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    required this.iconPath,
    required this.text,
    super.key,
  });

  final String iconPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          child: Image.asset(
            iconPath,
          ),
        ),
        const SizedBox(height: 10),
        Text(text, style: theme.textTheme.bodyLarge),
      ],
    );
  }
}
