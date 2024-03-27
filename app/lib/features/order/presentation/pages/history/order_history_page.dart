import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('История заказов', style: theme.textTheme.titleSmall),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.router.back(),
        ),
      ),
      body: const OrderHistoryBody(),
    );
  }
}

class OrderHistoryBody extends StatefulWidget {
  const OrderHistoryBody({super.key});

  @override
  State<OrderHistoryBody> createState() => _OrderHistoryBodyState();
}

class _OrderHistoryBodyState extends State<OrderHistoryBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: 1,
      itemBuilder: (context, index) {
        return Card(
          child: ExpansionTile(
            shape: const Border(
              bottom: BorderSide(color: Colors.transparent, width: 0),
            ),
            childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
            title: const Text('Курица с картошкой'),
            subtitle: const Text('12.12.2021 12:12'),
            children: [
              CartHistoryWidgets(
                title: 'Курица с картошкой',
                subtitle: '1 кг',
                price: 150,
                counter: 1,
                imageUrl: 'https://i.ibb.co/GkL25DB/ALE-1357-7.png',
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
