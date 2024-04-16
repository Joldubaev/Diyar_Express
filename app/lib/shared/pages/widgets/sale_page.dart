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

class SaleWidget extends StatelessWidget {
  const SaleWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.onTap,
  });

  final String title;
  final String description;
  final String image;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(image),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
