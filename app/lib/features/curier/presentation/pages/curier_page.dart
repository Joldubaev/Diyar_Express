import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/core/router/routes.gr.dart';
import 'package:diyar_express/features/curier/curier.dart';
import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/components/components.dart';
import 'package:diyar_express/core/core.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:diyar_express/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

@RoutePage()
class CurierPage extends StatefulWidget {
  const CurierPage({super.key});

  @override
  State<CurierPage> createState() => _CurierPageState();
}

class _CurierPageState extends State<CurierPage> {
  final mapControllerCompleter = Completer<YandexMapController>();
  late List<CurierOrderModel> orders;

  @override
  void initState() {
    context.read<CurierCubit>().getCuriers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.activeOrders, style: const TextStyle(fontSize: 16)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              AppAlert.showConfirmDialog(
                context: context,
                title: context.l10n.exit,
                content: Text(context.l10n.areYouSure),
                cancelText: context.l10n.no,
                confirmText: context.l10n.yes,
                cancelPressed: () => Navigator.pop(context),
                confirmPressed: () {},
              );
            },
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: BlocBuilder<CurierCubit, CurierState>(
        builder: (context, state) {
          if (state is CurierError) {
            return const Center(child: Text('Ошибка при загрузке данных'));
          } else if (state is CurierLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CurierLoaded) {
            orders = state.curiers;
            if (state.curiers.isEmpty) {
              return const Center(child: Text('No orders'));
            }
          }
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(0),
                child: ExpansionTile(
                  shape: const Border(bottom: BorderSide(color: Colors.transparent, width: 0)),
                  childrenPadding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
                  title: Text(
                    '${context.l10n.orderNumber} ${orders[index].orderNumber}',
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: AppColors.black1,
                    ),
                  ),
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(Icons.copy_rounded),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: '${orders[index].address}'));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(context.l10n.addressIsCopied)));
                        },
                      ),
                    ),
                    FittedBox(
                        fit: BoxFit.none,
                        child: Text('${orders[index].address}',
                            maxLines: 3, style: const TextStyle(color: AppColors.black1, fontSize: 13))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextButton(
                          onPressed: () {
                            context.router.push(
                              OrderDetailRoute(
                                orderNumber: "${orders[index].orderNumber}",
                              ),
                            );
                          },
                          textButton: context.l10n.orderDetails,
                        ),
                        CustomTextButton(
                          onPressed: () {
                            _finishOrder(orders[index].orderNumber ?? 0);
                          },
                          textButton: context.l10n.finishOrder,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          AppLaunch.launchURL('https://2gis.kg/bishkek');
        },
        child: Image.asset('assets/images/gis.png'),
      ),
    );
  }

  void _finishOrder(int orderNumber) {
    context.read<CurierCubit>().getFinishOrder(orderNumber);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Заказ завершен'),
      ),
    );
    setState(() {
      orders.removeWhere((order) => order.orderNumber == orderNumber);
    });
  }
}
