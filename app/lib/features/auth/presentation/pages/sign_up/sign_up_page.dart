import 'package:auto_route/annotations.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:diyar_express/features/auth/presentation/presentation.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
          children: [
            Center(
                child: Text(
              "Регистрация",
              style: theme.textTheme.titleLarge,
            )),
            const SizedBox(height: 10),
            const SignUpForm(),
          ],
        ),
      ),
    );
  }
}
