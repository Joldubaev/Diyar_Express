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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DiyarExpress'),
        ),
        body: const Center(
          child: Text('DiyarExpress'),
        ),
      ),
    );
  }
}
