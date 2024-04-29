import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.router.maybePop();
          },
        ),
        title: Text('О нас', style: theme.textTheme.titleSmall!),
      ),
      body: const SafeArea(
        child: AboutUsBody(),
      ),
    );
  }
}

class AboutUsBody extends StatefulWidget {
  const AboutUsBody({super.key});

  @override
  State<AboutUsBody> createState() => _AboutUsBodyState();
}

class _AboutUsBodyState extends State<AboutUsBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 20, right: 20),
      children: [
        HallCardWidget(
          hallName: 'Чайхана',
          imagePath: 'assets/images/vip_hall.png',
          title: 'Изящное переплетение востока и запада',
          onPressed: () {},
        ),
        HallCardWidget(
          hallName: 'Ресторан',
          imagePath: 'assets/images/rest_hall.png',
          title: 'Европейский стиль зала создаст для вас незабываемый отдых',
          onPressed: () {},
        ),
        HallCardWidget(
          hallName: 'Банкетный зал',
          imagePath: 'assets/images/vip_hall.png',
          title: '8 закрытых зала с живой музыкой',
          onPressed: () {},
        ),
        HallCardWidget(
          hallName: 'VIP зал',
          imagePath: 'assets/images/vip_hall.png',
          title: 'Мы проводим торжества, той,',
          onPressed: () {},
        )
      ],
    );
  }
}
