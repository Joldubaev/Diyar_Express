import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/app/router/routes.gr.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:diyar_express/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppColors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    radius: 30,
                    child: SvgPicture.asset('assets/icons/profile_icon.svg',
                        height: 80, colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn))),
                const SizedBox(height: 10),
                const Text(
                  'John Doe',
                  style: TextStyle(
                    color: AppColors.black1,
                    fontSize: 18,
                  ),
                ),
                const Text(
                  '+996 555 555 555',
                  style: TextStyle(
                    color: AppColors.black1,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(
              'Профиль',
              style: theme.textTheme.bodyMedium!.copyWith(
                color: AppColors.black1,
              ),
            ),
            onTap: () {
              context.router.push(const CurierProfileRoute());
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: Text(
              'Активные заказы',
              style: theme.textTheme.bodyMedium!.copyWith(
                color: AppColors.black1,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: Text(
              'История заказов',
              style: theme.textTheme.bodyMedium!.copyWith(
                color: AppColors.black1,
              ),
            ),
            onTap: () {
              context.router.push(const HistoryPage());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(
              'Выйти',
              style: theme.textTheme.bodyMedium!.copyWith(
                color: AppColors.red,
              ),
            ),
            onTap: () {
              AppAlert.showConfirmDialog(
                context: context,
                title: 'Выход',
                content: const Text('Вы уверены, что хотите выйти?'),
                cancelText: 'Нет',
                confirmText: 'Да',
                cancelPressed: () => Navigator.pop(context),
                confirmPressed: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}
