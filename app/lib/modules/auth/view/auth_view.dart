import 'package:diyar_express/components/custom_input_widget.dart';
import 'package:diyar_express/components/submit_button_widget.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:diyar_express/utils/validators.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 2),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Вход', style: theme.textTheme.titleLarge),
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
                const SizedBox(height: 10),
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
                SubmitButtonWidget(
                  title: "Войти",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print('Email: ${_emailController.text}');
                      print('Password: ${_passwordController.text}');
                    }
                  },
                  bgColor: AppColors.primary,
                  textStyle: theme.textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
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
