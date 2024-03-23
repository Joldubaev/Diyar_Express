import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';

class ContactCardWidget extends StatelessWidget {
  const ContactCardWidget({
    required this.imagePath,
    required this.title,
    required this.onPressed,
    required this.subtitle,
    super.key,
  });
  final String imagePath;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: SelectableText(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        onTap: onPressed,
        trailing: Icon(
          Icons.phone,
          color: theme.colorScheme.onSurface,
          size: 20,
        ),
      ),
    );
  }
}
