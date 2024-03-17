import 'package:diyar_express/app/app.dart';
import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const DiyarExpress();
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
