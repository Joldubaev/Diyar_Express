import 'package:diyar_express/features/menu/menu.dart';
import 'package:diyar_express/shared/shared.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuHeaderWidget extends StatefulWidget {
  final Function(int)? onTapMenu;
  const MenuHeaderWidget({super.key, this.onTapMenu});

  @override
  State<MenuHeaderWidget> createState() => _MenuHeaderWidgetState();
}

class _MenuHeaderWidgetState extends State<MenuHeaderWidget> {
  bool isSearchVisible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!isSearchVisible) const SizedBox(width: 16),
          if (!isSearchVisible) Text("Menu", style: Theme.of(context).textTheme.titleSmall),
          if (!isSearchVisible) const SizedBox(width: 20),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const MenuToggleButton(),
                if (isSearchVisible)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: TextField(
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          hintText: "Поиск...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.search),
                          fillColor: AppColors.grey1,
                          filled: true,
                          contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                          constraints: const BoxConstraints(maxHeight: 40),
                        ),
                        onChanged: (value) {
                          EasyDebounce.debounce(
                            'Debouncer',
                            const Duration(milliseconds: 500),
                            () {
                              context.read<MenuCubit>().getProductsWithMenu(
                                    query: value,
                                  );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                (!isSearchVisible)
                    ? IconButton(
                        onPressed: () => setState(() => isSearchVisible = true),
                        icon: const Icon(Icons.search),
                      )
                    : IconButton(
                        onPressed: () => setState(() => isSearchVisible = false),
                        icon: const Icon(Icons.close),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
