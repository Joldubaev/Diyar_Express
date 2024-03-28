import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/app/router/routes.gr.dart';
import 'package:diyar_express/core/core.dart';
import 'package:diyar_express/features/profile/presentation/presentation.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:diyar_express/utils/fmt/show_alert.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        title: Text(
          'Личный кабинет',
          style: theme.textTheme.titleSmall,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => context.pushRoute(const ProfileInfoRoute()),
              child: const ProfileTile(
                iconPath: 'assets/images/succes.png',
                text: 'Имя Фамилия',
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SettingsTile(
                text: 'История заказов',
                onPressed: () {
                  context.pushRoute(const OrderHistoryRoute());
                },
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SettingsTile(
                    text: 'О нас',
                    onPressed: () => context.pushRoute(const AboutUsRoute()),
                  ),
                  SettingsTile(
                    text: 'Контакты',
                    onPressed: () => context.pushRoute(const ContactRoute()),
                  ),
                  SettingsTile(
                    text: 'Пользовательское соглашение',
                    onPressed: () {
                      AppLaunch.launchURL(
                        'https://docs.google.com/document/d/1jww3-H3VeV0l_zYQS7zmlKGzQYwOwFisOb3MaIo5bsQ/edit?usp=sharing',
                        context: context,
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SettingsTile(
                text: 'Выход',
                onPressed: () {
                  AppAlert.showConfirmDialog(
                    context: context,
                    title: 'Выход',
                    content: const Text('Вы уверены, что хотите выйти?'),
                    cancelText: 'Нет',
                    confirmText: 'Да',
                    cancelPressed: () => Navigator.pop(context),
                    confirmPressed: () {
                      context.router.replace(const SignInRoute());
                    },
                  );
                },
                icon: Icons.exit_to_app,
                color: theme.colorScheme.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
