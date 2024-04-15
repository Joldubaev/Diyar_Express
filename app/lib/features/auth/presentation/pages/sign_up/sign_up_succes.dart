import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/core/router/routes.gr.dart';
import 'package:diyar_express/shared/components/components.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const double paddingValue = 20.0;

@RoutePage()
class SignUpSucces extends StatelessWidget {
  const SignUpSucces({Key? key}) : super(key: key);

  Widget buildCheckIcon() {
    return SvgPicture.asset(
      'assets/icons/check.svg',
      height: 150,
      width: 150,
    );
  }

  Widget buildSuccessText() {
    return Text(
      "Аккаунт успешно создан!",
      style: theme.textTheme.titleSmall,
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingValue),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCheckIcon(),
                const SizedBox(height: 30),
                buildSuccessText(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SubmitButtonWidget(
          title: 'Далее',
          bgColor: AppColors.primary,
          textStyle: theme.textTheme.bodyMedium!.copyWith(
            color: AppColors.white,
          ),
          onTap: () {
            context.router.pushAndPopUntil(
              const MainRoute(),
              predicate: (_) => false,
            );
          },
        ),
      ),
    );
  }
}
