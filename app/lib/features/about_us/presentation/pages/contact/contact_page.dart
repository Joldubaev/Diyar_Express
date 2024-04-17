import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/core/core.dart';
import 'package:diyar_express/features/profile/presentation/presentation.dart';
import 'package:diyar_express/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary[200],
      appBar: AppBar(
        title: TextButton.icon(
            label: Text('Контакты', style: theme.textTheme.bodyLarge!.copyWith(color: AppColors.primary)),
            icon: const Icon(FontAwesomeIcons.headset, color: AppColors.primary, size: 40),
            onPressed: () {}),
      ),
      body: const ContactBody(),
    );
  }
}

class ContactBody extends StatefulWidget {
  const ContactBody({super.key});

  @override
  State<ContactBody> createState() => _ContactBodyState();
}

class _ContactBodyState extends State<ContactBody> {
  bool _hasCallSupport = false;
  final String delivery = ' 0777 99 77 99';
  final String diyarExpress = '0559 69 47 77';
  final String diyarRestaurant = '0550 55 59 99';
  final String diyarBanketHall = '0555 51 11 15';
  final String diyarCafe = '0555 55 55 08';

  @override
  void initState() {
    super.initState();
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      children: [
        Card(
          child: Column(
            children: [
              ListTile(
                title: Text('Адрес', style: theme.textTheme.bodyLarge!.copyWith(color: AppColors.primary)),
                subtitle: Text('г. Бишкек, ул. Логвиненко 1/1',
                    style: theme.textTheme.bodyMedium!.copyWith(color: AppColors.black1)),
              ),
              ListTile(
                title: Text('Время работы', style: theme.textTheme.bodyLarge!.copyWith(color: AppColors.primary)),
                subtitle: Text('09:00 - 23:00', style: theme.textTheme.bodyMedium!.copyWith(color: AppColors.black1)),
              ),
            ],
          ),
        ),
        ContactCardWidget(
            subtitle: delivery,
            imagePath: 'assets/images/phone.png',
            title: 'Служба доставки',
            onPressed: _hasCallSupport ? () => _makePhoneCall(delivery) : () {}),
        ContactCardWidget(
          subtitle: diyarExpress,
          imagePath: 'assets/images/phone.png',
          title: 'Дияр Экспресс',
          onPressed: _hasCallSupport ? () => _makePhoneCall(diyarExpress) : () {},
        ),
        ContactCardWidget(
          subtitle: diyarRestaurant,
          imagePath: 'assets/images/phone.png',
          title: 'Дияр Ресторан',
          onPressed: _hasCallSupport ? () => _makePhoneCall(diyarRestaurant) : () {},
        ),
        ContactCardWidget(
          subtitle: diyarBanketHall,
          imagePath: 'assets/images/phone.png',
          title: 'Дияр Банкет Холл',
          onPressed: _hasCallSupport ? () => _makePhoneCall(diyarBanketHall) : () {},
        ),
        ContactCardWidget(
          subtitle: diyarCafe,
          imagePath: 'assets/images/phone.png',
          title: 'Дияр Банкет Холл',
          onPressed: _hasCallSupport ? () => _makePhoneCall(diyarCafe) : () {},
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  AppLaunch.launchURL(AppConst.instagram);
                },
                icon: const Icon(FontAwesomeIcons.instagram, color: AppColors.black1, size: 40)),
            const SizedBox(width: 20),
            IconButton(
                onPressed: () {
                  AppLaunch.launchURL(AppConst.email);
                },
                icon: const Icon(Icons.mail, color: AppColors.black1, size: 40)),
          ],
        ),
      ],
    );
  }
}
