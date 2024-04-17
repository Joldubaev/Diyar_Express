import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/core/router/routes.gr.dart';
import 'package:diyar_express/features/profile/presentation/presentation.dart';
import 'package:diyar_express/shared/shared.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: HomaPageBody()));
  }
}

class HomaPageBody extends StatefulWidget {
  const HomaPageBody({super.key});

  @override
  State<HomaPageBody> createState() => _HomaPageBodyState();
}

class _HomaPageBodyState extends State<HomaPageBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child:
                      Image.asset('assets/images/app_logo.png', height: 60, fit: BoxFit.fill, color: AppColors.primary),
                ),
                const Divider(color: AppColors.primary, thickness: 1),
                const Text(
                  'Акции',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                SaleWidget(
                  title: 'Скидка 10%',
                  description: 'На все блюда',
                  image: 'assets/images/banner.png',
                  onTap: () => context.router.push(const SaleRoute()),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Популярные блюда',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 11,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 200,
                        margin: const EdgeInsets.only(right: 15),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/banner.png',
                              height: 80,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(height: 5),
                            const Text('Блюдо',
                                style: TextStyle(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text('О нас', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                CustonClipRectWidget(
                    image: 'assets/images/about.png', onTap: () => context.router.push(const AboutUsRoute())),
                const SizedBox(height: 10),
                const Text('Новости', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                SaleWidget(
                    title: 'Новости',
                    description: 'Последние новости',
                    image: 'assets/images/news.png',
                    onTap: () => context.router.push(const NewsRoute())),
                const SizedBox(height: 20),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 236, 174, 123),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SettingsTile(
                        icon: Icons.phone,
                        text: 'Контакты',
                        onPressed: () => context.router.push(const ContactRoute()))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
