import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/app/router/routes.gr.dart';
import 'package:diyar_express/components/components.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({super.key});

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TabBarPage(),
    );
  }
}

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  TabBarPageState createState() => TabBarPageState();
}

class TabBarPageState extends State<TabBarPage> with SingleTickerProviderStateMixin {
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
          title: const Text(
            'Детали заказа',
            style: TextStyle(fontSize: 16),
          ),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_sharp), onPressed: () => context.router.replace(const CartRoute())),
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
                child: const TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black54,
                  tabs: [
                    TabItem(title: 'Доставка'),
                    TabItem(title: 'Самовывоз'),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: const SafeArea(
          child: TabBarView(
            children: [
              DeliveryForm(),
              PickupForm(),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SubmitButtonWidget(
            title: 'Оформить заказ на 220с',
            bgColor: AppColors.primary,
            textStyle: theme.textTheme.bodyMedium!.copyWith(
              color: AppColors.white,
            ),
            onTap: () {
              context.router.replace(const OrderSuccess());
            },
          ),
        ),
      ),
    );
  }
}
