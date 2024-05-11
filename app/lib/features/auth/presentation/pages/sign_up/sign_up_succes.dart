import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/core/router/routes.gr.dart';
import 'package:diyar_express/injection_container.dart';
import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/components/components.dart';
import 'package:diyar_express/shared/constants/app_const/app_const.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SignUpSucces extends StatelessWidget {
  const SignUpSucces({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/check.svg',
                  height: 150,
                  width: 150,
                ),
                const SizedBox(height: 30),
                Text(
                  context.l10n.accountCreatedSuccessfully,
                  style: theme.textTheme.titleSmall,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SubmitButtonWidget(
          title: context.l10n.next,
          bgColor: AppColors.primary,
          textStyle: theme.textTheme.bodyMedium!.copyWith(
            color: AppColors.white,
          ),
          onTap: () {
            var role = sl<SharedPreferences>().getString(AppConst.userRole);
            if (role?.toLowerCase() == "user".toLowerCase()) {
              context.router.pushAndPopUntil(
                const MainRoute(),
                predicate: (_) => false,
              );
            } else {
              context.router.pushAndPopUntil(
                const CurierRoute(),
                predicate: (_) => false,
              );
            }
          },
        ),
      ),
    );
  }
}
