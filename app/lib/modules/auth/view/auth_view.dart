import 'dart:developer';

import 'package:diyar_express/components/components.dart';
import 'package:diyar_express/modules/modules.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:diyar_express/utils/validators.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Image.asset('assets/images/auth_images.png'),
        ),
      ),
      bottomSheet: const AuthView(),
    );
  }
}

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      backgroundColor: Colors.white,
      showDragHandle: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.58,
        minHeight: MediaQuery.of(context).size.height * 0.58,
      ),
      onClosing: () {},
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 2),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Center(
                  child: Text('Добро пожаловать!', style: theme.textTheme.titleLarge),
                ),
                const SizedBox(height: 10),
                TextButtonLogin(
                  title: 'Войдите в свой аккаунт',
                  traling: 'Регистрация',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                CustomInputWidget(
                  title: 'Email',
                  hintText: "asanov@gmail.com",
                  inputType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Пожалуйста, введите email.';
                    } else if (!isEmailValid(value)) {
                      return 'Пожалуйста, введите корректный email.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomInputWidget(
                  hintText: "********",
                  title: 'Пароль',
                  controller: _passwordController,
                  isPasswordField: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Пожалуйста, введите пароль.';
                    } else if (value.length < 6 && isPasswordValid(value)) {
                      return 'Пароль должен содержать не менее 6 символов.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextButton(child: const Text('Продолжая вы соглашаетесь с политикой'), onPressed: () {}),
                SubmitButtonWidget(
                  title: "Войти",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      log('Email: ${_emailController.text}');
                      log('Password: ${_passwordController.text}');
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ),
                    );
                  },
                  bgColor: AppColors.primary,
                  textStyle: theme.textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }
}
