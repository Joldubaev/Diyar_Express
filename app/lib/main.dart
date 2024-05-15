import 'package:diyar_express/core/router/routes.dart';
import 'package:diyar_express/features/curier/curier.dart';
import 'package:diyar_express/firebase_options.dart';
import 'package:diyar_express/shared/cubit/popular_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:diyar_express/injection_container.dart' as di;
import 'package:diyar_express/features/cart/cart.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home_features/presentation/cubit/home_features_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}

var appRoute = AppRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<SignUpCubit>()),
        BlocProvider(create: (context) => di.sl<SignInCubit>()),
        BlocProvider(create: (context) => di.sl<ProfileCubit>()),
        BlocProvider(create: (context) => di.sl<SignInCubit>()),
        BlocProvider(create: (context) => di.sl<CartCubit>()),
        BlocProvider(create: (context) => di.sl<MenuCubit>()),
        BlocProvider(create: (context) => di.sl<PopularCubit>()),
        BlocProvider(create: (context) => di.sl<OrderCubit>()),
        BlocProvider(create: (context) => di.sl<AboutUsCubit>()),
        BlocProvider(create: (context) => di.sl<HomeFeaturesCubit>()),
        BlocProvider(create: (context) => di.sl<HistoryCubit>()),
        BlocProvider(create: (context) => di.sl<CurierCubit>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routerConfig: appRoute.config(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('ru'),
      ),
    );
  }
}
