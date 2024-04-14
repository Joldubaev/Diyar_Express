import 'package:flutter/material.dart';

@immutable
final class AppBottomSheet {
  static Future<T?> showBottomSheet<T>(
    BuildContext context,
    Widget child, {
    double initialChildSize = 0.6,
    Color? backgroundColor,
    Key? scrollKey,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      builder: (_) {
        return DraggableScrollableSheet(
          initialChildSize: initialChildSize,
          maxChildSize: 0.86,
          minChildSize: 0.4,
          expand: false,
          builder: (ctx, ctrl) {
            return Column(
              children: [
                const SizedBox(height: 8),
                const SizedBox(
                  height: 30,
                  child: Icon(Icons.maximize_rounded, size: 50, color: Colors.grey),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    key: scrollKey,
                    controller: ctrl,
                    child: child,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
