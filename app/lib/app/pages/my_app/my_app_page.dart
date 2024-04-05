import 'package:diyar_express/app/app.dart';
import 'package:diyar_express/features/auth/presentation/cubit/sign_in/sign_in_cubit.dart';
import 'package:diyar_express/features/auth/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diyar_express/injection_container.dart' as di;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => di.sl<SignUpCubit>()),
      BlocProvider(create: (context) => di.sl<SignInCubit>()),
      BlocProvider(create: (context) => di.sl<ProfileCubit>()),
      BlocProvider(create: (context) => di.sl<SignInCubit>()),
      BlocProvider(create: (context) => di.sl<MenuCubit>())
    ], child: const DiyarExpress());
  }
}

var appRoute = AppRouter();

class DiyarExpress extends StatelessWidget {
  const DiyarExpress({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme,
      routerConfig: appRoute.config(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
