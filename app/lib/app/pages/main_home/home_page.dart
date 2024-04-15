import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/app/router/routes.gr.dart';
import 'package:diyar_express/theme/theme.dart';
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
    return const SafeArea(
      child: Scaffold(
        body: HomaPageBody(),
      ),
    );
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
                const AnimatedTextWidget(),
                const Divider(color: AppColors.primary, thickness: 1),
                const Text(
                  'Акции',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const SaleWidget(),
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
                        margin: const EdgeInsets.only(left: 15),
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
                            const Text(
                              'Блюдо',
                              style: TextStyle(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'О нас',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    context.router.push(const AboutUsRoute());
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/about.png',
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SaleWidget extends StatelessWidget {
  const SaleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/images/banner.png',
            fit: BoxFit.cover,
            height: 200,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          top: 30,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Скидка 10%',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'На все блюда',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedTextWidget extends StatelessWidget {
  const AnimatedTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Text(
          'У нас всегда вкусно и:',
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: AppColors.primary),
        ),
        const SizedBox(width: 20.0, height: 40.0),
        DefaultTextStyle(
          style: const TextStyle(
            fontSize: 12.0,
            fontFamily: 'Horizon',
            color: AppColors.primary,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              RotateAnimatedText(
                'НЕОБЫЧНОЕ',
                textStyle: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
              ),
              RotateAnimatedText(
                'ПОЛЕЗНОЕ',
                textStyle: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
              ),
              RotateAnimatedText(
                'СВЕЖЕЕ',
                textStyle: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
              ),
              RotateAnimatedText(
                'ИЗЫСКАННОЕ',
                textStyle: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
              ),
              RotateAnimatedText(
                'ПИТАТЕЛЬНОЕ',
                textStyle: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
              ),
            ],
            onTap: () {},
            isRepeatingAnimation: true,
            totalRepeatCount: 15,
          ),
        ),
      ],
    );
  }
}
