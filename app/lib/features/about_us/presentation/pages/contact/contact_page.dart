import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/features/profile/presentation/presentation.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Контакты', style: theme.textTheme.titleSmall),
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
      ],
    );
  }
}
