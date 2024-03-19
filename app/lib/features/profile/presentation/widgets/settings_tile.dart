import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    required this.text,
    this.hasNotification = false,
    this.onPressed,
    this.icon,
    this.color,
    super.key,
  });

  final String text;
  final Color? color;
  final IconData? icon;
  final bool hasNotification;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      contentPadding: const EdgeInsets.fromLTRB(12, 4, 6, 4),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: theme.textTheme.bodyLarge),
          Badge(isLabelVisible: hasNotification),
        ],
      ),
      trailing: Icon(
        icon ?? Icons.arrow_forward_ios,
        color: color ?? theme.colorScheme.onSurface,
        size: 20,
      ),
      shape: Border(
        bottom: BorderSide(color: theme.colorScheme.onSurface.withOpacity(0.1)),
      ),
    );
  }
}
