import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    required this.text,
    this.onPressed,
    this.icon,
    this.color,
    super.key,
  });

  final String text;
  final Color? color;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onPressed,
          hoverColor: Colors.black26,
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            text,
            style: theme.textTheme.bodyLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Icon(
            icon ?? Icons.arrow_forward_ios,
            color: color ?? theme.colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}
