import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/app/router/routes.gr.dart';
import 'package:diyar_express/components/components.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:diyar_express/utils/utils.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                  child: Text('Добро пожаловать!',
                      style: theme.textTheme.titleLarge),
                ),
                const SizedBox(height: 10),
                TextButtonLogin(
                  title: 'Войдите в свой аккаунт',
                  traling: 'Регистрация',
                  onPressed: () {
                    context.pushRoute(const SignInRoute());
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
                TextButton(
                    child: const Text('Продолжая вы соглашаетесь с политикой'),
                    onPressed: () {}),
                SubmitButtonWidget(
                  title: "Войти",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                    context.pushRoute(const HomeRoute());
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
