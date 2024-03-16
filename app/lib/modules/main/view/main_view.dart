import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/modules/modules.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: _currentIndex,
      keepPage: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          _currentIndex = value;
          setState(() {});
        },
        children: const [
          HomePage(),
          OrdersView(),
          MenuView(),
          CartView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home_icon.svg',
              colorFilter: ColorFilter.mode(
                _currentIndex == 0 ? AppColors.primary : AppColors.black1,
                BlendMode.srcIn,
              ),
              height: 26,
            ),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/orders_icon.svg',
              colorFilter: ColorFilter.mode(
                _currentIndex == 1 ? AppColors.primary : AppColors.black1,
                BlendMode.srcIn,
              ),
              height: 26,
            ),
            label: 'Заказы',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/menu_icon.svg',
              colorFilter: ColorFilter.mode(
                _currentIndex == 2 ? AppColors.primary : AppColors.black1,
                BlendMode.srcIn,
              ),
              height: 26,
            ),
            label: 'Меню',
          ),
          BottomNavigationBarItem(
            icon: Badge(
              label: const Text("3"),
              isLabelVisible: true,
              child: SvgPicture.asset(
                'assets/icons/cart_icon.svg',
                colorFilter: ColorFilter.mode(
                  _currentIndex == 3 ? AppColors.primary : AppColors.black1,
                  BlendMode.srcIn,
                ),
                height: 26,
              ),
            ),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/profile_icon.svg',
              colorFilter: ColorFilter.mode(
                _currentIndex == 4 ? AppColors.primary : AppColors.black1,
                BlendMode.srcIn,
              ),
              height: 26,
            ),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 10),
      curve: Curves.bounceIn,
    );
  }
}
