import 'package:diyar_express/l10n/l10n.dart';
import 'package:flutter/material.dart';

class EmptyAboutUsWidget extends StatelessWidget {
  const EmptyAboutUsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          context.l10n.emptyText,
          style: const TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}
