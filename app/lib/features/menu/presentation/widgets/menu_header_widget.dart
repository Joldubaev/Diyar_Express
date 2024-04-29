import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/core/router/routes.gr.dart';
import 'package:diyar_express/features/menu/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MenuHeaderWidget extends StatefulWidget {
  final Function(int idx)? onTapMenu;
  const MenuHeaderWidget({super.key, this.onTapMenu});

  @override
  State<MenuHeaderWidget> createState() => _MenuHeaderWidgetState();
}

class _MenuHeaderWidgetState extends State<MenuHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 16),
          Text("Menu", style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(width: 20),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MenuToggleButton(onTapItem: widget.onTapMenu),
                IconButton(
                  onPressed: () => context.pushRoute(const SearchMenuRoute()),
                  icon: const Icon(Icons.search),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
