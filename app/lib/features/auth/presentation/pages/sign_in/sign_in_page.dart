import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:diyar_express/features/auth/presentation/presentation.dart';

@RoutePage()
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Image(
                height: 200,
                width: 200,
                color: AppColors.primary,
                image: AssetImage("assets/images/auth_images.png"),
              ),
            ),
            const SizedBox(height: 10),
            Center(
                child: Text(
              "Вход",
              style: theme.textTheme.titleLarge,
            )),
            const SizedBox(
              height: 10,
            ),
            const LoginForm(),
          ],
        ),
      ),
    );
  }
}
