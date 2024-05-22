import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.l10n.orderHistory,
            style: GoogleFonts.aBeeZee(
              color: AppColors.black1,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 40,
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: AppColors.grey.withOpacity(0.2),
                ),
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
        body: PageStorage(
          bucket: PageStorageBucket(),
          child: const TabBarView(
            children: [ActiveOrderPage(), OrderHistory()],
          ),
        ),
      ),
    );
  }
}
