import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/app/pages/main_home/home_page.dart';
import 'package:diyar_express/app/router/routes.gr.dart';
import 'package:diyar_express/components/components.dart';
import 'package:diyar_express/features/auth/data/models/sign_up_model.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:diyar_express/utils/snackbar/snackbar_message.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomInputWidget(
              title: 'E-Mail',
              hintText: "E-Mail",
              controller: _usernameController,
              isPasswordField: false,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Пожалуйста, введите ваш E-Mail';
                } else if (!EmailValidator.validate(value)) {
                  return 'Пожалуйста, введите корректный E-Mail';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomInputWidget(
              title: 'Пароль',
              hintText: "******",
              controller: _passwordController,
              isPasswordField: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Пожалуйста, введите ваш пароль';
                } else if (value.length < 5) {
                  return 'Пароль должен содержать не менее 5 символов';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<SignInCubit, SignInState>(
              listener: (context, state) {
                if (state is SignInFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: const Color.fromARGB(255, 150, 33, 49),
                    ),
                  );
                } else if (state is SignInSuccessWithUser) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                    (route) => false,
                  );
                }
              },
              builder: (context, state) {
                if (state is SignInLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SignInFailure) {
                  return Column(
                    children: [
                      Center(
                        child: Text(
                          'Регистрация не удалась. Пожалуйста, попробуйте еще раз.',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: const Color.fromARGB(255, 233, 71, 35),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SubmitButtonWidget(
                        textStyle: theme.textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                        ),
                        bgColor: AppColors.primary,
                        title: 'Войти',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<SignInCubit>().signInUser(
                                  UserModel(
                                    email: _usernameController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                          }
                        },
                      ),
                    ],
                  );
                }

                return SubmitButtonWidget(
                  textStyle: theme.textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
                  bgColor: AppColors.primary,
                  title: 'Войти',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<SignInCubit>().signInUser(
                            UserModel(
                              email: _usernameController.text,
                              password: _passwordController.text,
                            ),
                          );
                    }
                  },
                );
              },
            ),
            const LineOrWidget(),
            GoogleButton(
                color: AppColors.primary,
                onPressed: () {
                  SnackBarMessage().showErrorSnackBar(
                    message: "Пока не доступно",
                    context: context,
                  );
                }),
            TextCheckButton(
              text: "Нет аккаунта?",
              route: "Зарегистрироваться",
              onPressed: () {
                context.pushRoute(const SignUpRoute());
              },
            )
          ],
        ),
      ),
    );
  }
}
