// import 'package:diyar_express/app/app.dart';
import 'package:diyar_express/modules/modules.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const DiyarExpress();
  }
}

class DiyarExpress extends StatefulWidget {
  const DiyarExpress({super.key});

  @override
  State<DiyarExpress> createState() => _DiyarExpressState();
}

class _DiyarExpressState extends State<DiyarExpress> {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   routerConfig: AppRouter.router,
    // );
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthView(),
    );
  }
}
