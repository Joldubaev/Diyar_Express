import 'package:auto_route/annotations.dart';
import 'package:diyar_express/components/components.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo.png",
          height: 55,
        ),
        centerTitle: true,
        toolbarHeight: 60,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Популярные блюда",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.73,
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              children: List.generate(
                10,
                (index) => const ProductItemWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
