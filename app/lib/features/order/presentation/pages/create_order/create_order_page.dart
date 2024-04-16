import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/core/router/routes.gr.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/shared/theme/theme.dart';
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
  late bool showFab;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    showFab = tabController.index == 0;
    tabController.addListener(() {
      setState(() {
        showFab = tabController.index == 0;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Детали заказа',
              style: TextStyle(fontSize: 16),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_sharp),
              onPressed: () => context.pushRoute(const CartRoute()),
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
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: AppColors.grey.withOpacity(0.2)),
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
          body: const TabBarView(
            children: [
              DeliveryFormPage(),
              PickupForm(),
            ],
          ),
          bottomNavigationBar: Container(
            height: 60,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 210, 210, 210),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 5),
              indicator: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(24),
              ),
              tabs: [
                Tab(
                  icon: const Icon(Icons.delivery_dining, color: AppColors.white),
                  child: Text(
                    'Доставка',
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
                Tab(
                  icon: const Icon(Icons.storefront, color: AppColors.white),
                  child: Text(
                    'Самовывоз',
                    style: theme.textTheme.bodyMedium!.copyWith(color: AppColors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
