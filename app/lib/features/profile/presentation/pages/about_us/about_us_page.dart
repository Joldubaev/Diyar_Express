import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/features/profile/presentation/presentation.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('О нас', style: theme.textTheme.titleSmall),
      ),
      body: const AboutUsBody(),
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
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      children: [
        Text('Экспресс кафе', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 20),
        HallCardWidget(
          imagePath: 'assets/images/vip_hall.png',
          title: 'Изящное переплетение \n востока и запада',
          onPressed: () {},
        ),
        Text('Ресторан', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 20),
        HallCardWidget(
          imagePath: 'assets/images/rest_hall.png',
          title: 'Европейский стиль зала создаст  для вас незабываемый отдых',
          onPressed: () {},
        ),
        Text('Экспресс кафе', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 20),
        HallCardWidget(
          imagePath: 'assets/images/vip_hall.png',
          title: '8 закрытых зала \n с живой музыкой',
          onPressed: () {},
        ),
        Text('Экспресс кафе', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 20),
        HallCardWidget(
          imagePath: 'assets/images/vip_hall.png',
          title: 'Мы проводим \n торжества, той,',
          onPressed: () {},
        )
      ],
    );
  }
}
