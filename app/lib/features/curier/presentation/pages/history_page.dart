import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/components/tile/custom_tile.dart';
import 'package:diyar_express/features/curier/presentation/widgets/address_feild.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class Historypage extends StatelessWidget {
  const Historypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('История заказов'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: 2,
        itemBuilder: (context, index) {
          return Card(
            child: ExpansionTile(
              shape: const Border(
                bottom: BorderSide(color: Colors.transparent, width: 0),
              ),
              childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
              title: Text(
                'Номер заказа: 123',
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: AppColors.primary,
                ),
              ),
              subtitle: Text(
                '12.12.2021 12:12',
                style: theme.textTheme.bodySmall!.copyWith(color: AppColors.grey),
              ),
              children: [
                const CustomTile(
                  title: 'Стоимость блюд:',
                  trailing: '100 сoм',
                ),
                AddressField(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SelectableText('Уметалиева 64/1'),
                      IconButton(
                        icon: const Icon(Icons.copy_rounded),
                        onPressed: () {
                          Clipboard.setData(
                            const ClipboardData(text: 'Уметалиева 64/1'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Адрес скопирован')));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
