import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  OrderHistoryPageState createState() => OrderHistoryPageState();
}

class OrderHistoryPageState extends State<OrderHistoryPage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.l10n.orderHistory,
            style: const TextStyle(fontSize: 16),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)), color: AppColors.grey.withOpacity(0.2)),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelColor: AppColors.white,
                  unselectedLabelColor: Colors.black54,
                  tabs: [
                    TabItem(title: context.l10n.activeOrders),
                    TabItem(title: context.l10n.orderHistory),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: const SafeArea(
          child: TabBarView(
            children: [
              ActiveOrder(),
              OrderHistory(),
            ],
          ),
        ),
      ),
    );
  }
}
