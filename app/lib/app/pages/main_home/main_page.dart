import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/app/router/routes.gr.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        MenuRoute(),
        CartRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: SizedBox(
            height: 60,
            child: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              elevation: 45,
              enableFeedback: false,
              onTap: (value) {
                tabsRouter.setActiveIndex(value);
                setState(() {
                  _currentIndex = value;
                  tabsRouter.setActiveIndex(value);
                });
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primary,
              backgroundColor: Colors.white,
              unselectedItemColor: AppColors.grey,
              useLegacyColorScheme: false,
              selectedLabelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: SvgPicture.asset(
                      "assets/icons/home_icon.svg",
                      colorFilter: ColorFilter.mode(
                        _currentIndex == 0
                            ? AppColors.primary
                            : AppColors.black1,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  label: 'Главная ',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: SvgPicture.asset(
                      "assets/icons/menu_icon.svg",
                      colorFilter: ColorFilter.mode(
                        _currentIndex == 1
                            ? AppColors.primary
                            : AppColors.black1,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  label: 'Меню',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Badge(
                      label: const Text("9"),
                      isLabelVisible: true,
                      child: SvgPicture.asset(
                        "assets/icons/cart_icon.svg",
                        colorFilter: ColorFilter.mode(
                          _currentIndex == 2
                              ? AppColors.primary
                              : AppColors.black1,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  label: 'Корзина',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: SvgPicture.asset(
                      "assets/icons/profile_icon.svg",
                      colorFilter: ColorFilter.mode(
                        _currentIndex == 3
                            ? AppColors.primary
                            : AppColors.black1,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  label: 'Профиль',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
