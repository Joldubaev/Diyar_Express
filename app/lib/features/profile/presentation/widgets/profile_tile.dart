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
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 40, child: Image.asset(iconPath)),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: theme.textTheme.bodyLarge)),
          const SizedBox(width: 10),
          Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: theme.colorScheme.onSurface.withOpacity(0.6),
          ),
        ],
      ),
    );
  }
}
