import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/components/components.dart';
import 'package:diyar_express/core/core.dart';
import 'package:diyar_express/features/curier/presentation/widgets/address_feild.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:diyar_express/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../widgets/drawer_widget.dart';

@RoutePage()
class CurierPage extends StatefulWidget {
  const CurierPage({super.key});

  @override
  State<CurierPage> createState() => _CurierPageState();
}

class _CurierPageState extends State<CurierPage> {
  final mapControllerCompleter = Completer<YandexMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Активные заказы', style: TextStyle(fontSize: 16)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              AppAlert.showConfirmDialog(
                context: context,
                title: 'Выход',
                content: const Text('Вы уверены, что хотите выйти?'),
                cancelText: 'Нет',
                confirmText: 'Да',
                cancelPressed: () => Navigator.pop(context),
                confirmPressed: () {},
              );
            },
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: 1,
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
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(content: Text('Адрес скопирован')));
                              },
                            ),
                          ],
                        ),
                      ),
                      CustomTextButton(
                        onPressed: () {},
                        textButton: 'Завершит заказ',
                        description: 'Время доставки: 30 минут',
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          AppLaunch.launchURL('https://2gis.kg/bishkek');
        },
        child: Image.asset('assets/images/gis.png'),
      ),
    );
  }
}
