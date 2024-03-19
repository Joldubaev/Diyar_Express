import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/features/profile/presentation/presentation.dart';
import 'package:diyar_express/theme/theme.dart';
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
        title: Text(
          'Личный кабинет',
          style: theme.textTheme.titleSmall,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        children: [
          const ProfileTile(
            iconPath: 'assets/images/succes.png',
            text: 'Имя Фамилия',
          ),
          const SizedBox(height: 20),
          SettingsTile(
            text: 'Профиль',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserPage(),
                ),
              );
            },
          ),
          SettingsTile(
            text: 'История заказов',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrderHistoryPage(),
                ),
              );
            },
          ),
          SettingsTile(
            text: 'О нас',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutUsPage(),
                ),
              );
            },
          ),
          SettingsTile(
            text: 'Контакты',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContactPage(),
                ),
              );
            },
          ),
          SettingsTile(
            text: 'Пользовательское соглашение',
            onPressed: () {},
          ),
          SettingsTile(
            text: 'Выход',
            onPressed: () {},
            icon: Icons.exit_to_app,
            color: theme.colorScheme.error,
          ),
        ],
      ),
    );
  }
}
