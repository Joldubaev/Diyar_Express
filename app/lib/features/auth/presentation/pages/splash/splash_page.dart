import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/core/router/routes.gr.dart';
import 'package:diyar_express/features/auth/auth.dart';
import 'package:diyar_express/injection_container.dart';
import 'package:diyar_express/shared/constants/constant.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final token = sl<SharedPreferences>().getString(AppConst.accessToken);

  @override
  void initState() {
    super.initState();
    if (token != null && JwtDecoder.isExpired(token!)) {
      context.read<SignInCubit>().refreshToken();
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        context.router.pushAndPopUntil(
          const MainRoute(),
          predicate: (route) => false,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is RefreshTokenLoaded) {
            context.router.pushAndPopUntil(
              const MainRoute(),
              predicate: (route) => false,
            );
          } else if (state is RefreshTokenFailure) {
            context.router.pushAndPopUntil(
              const SignInRoute(),
              predicate: (route) => false,
            );
          }
        },
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/app_logo.png",
                  width: 150,
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: AppColors.white,
                    strokeCap: StrokeCap.round,
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
