import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/shared/shared.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SalePage extends StatelessWidget {
  const SalePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Акции'),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return SaleWidget(
            title: 'Скидка 50%',
            description: 'На все блюда',
            image: 'assets/images/banner.png',
            onTap: () => SnackBarMessage().showErrorSnackBar(message: 'Пока не доступно', context: context),
          );
        },
      ),
    );
  }
}
