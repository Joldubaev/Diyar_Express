import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MenuToggleButton extends StatelessWidget {
  const MenuToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showMenu(context),
      icon: const Icon(Icons.menu),
    );
  }

  showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.white,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 60,
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Menu", style: Theme.of(context).textTheme.titleSmall),
                  GestureDetector(
                    onTap: () => context.maybePop(),
                    child: const Icon(Icons.close, size: 35),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => context.maybePop(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Category $index",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const Spacer(),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "${index * index}",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(width: 6),
                              const Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const Divider(
                    color: Color(0xffDDDDDD),
                  ),
                  itemCount: 16,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
