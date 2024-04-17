import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/core/router/routes.gr.dart';
import 'package:diyar_express/injection_container.dart';
import 'package:diyar_express/shared/components/components.dart';
import 'package:diyar_express/features/auth/data/models/user_mpdel.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/shared/constants/app_const/app_const.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:diyar_express/shared/utils/show/bottom_sheet.dart';
import 'package:diyar_express/shared/utils/snackbar/snackbar_message.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final resedPasswordCode = TextEditingController();

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
              inputType: TextInputType.emailAddress,
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
              inputType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Пожалуйста, введите ваш пароль';
                } else if (value.length < 5) {
                  return 'Пароль должен содержать не менее 5 символов';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            BlocConsumer<SignInCubit, SignInState>(
              listener: (context, state) {
                if (state is SignInFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Логин или пароль неверный"),
                      backgroundColor: Color.fromARGB(255, 150, 33, 49),
                    ),
                  );
                } else if (state is SignInSuccessWithUser) {
                  var role = sl<SharedPreferences>().getString(AppConst.userRole);
                  if (role?.toLowerCase() == "user".toLowerCase()) {
                    context.router.pushAndPopUntil(
                      const MainRoute(),
                      predicate: (_) => false,
                    );
                  } else {
                    context.router.pushAndPopUntil(
                      const CurierRoute(),
                      predicate: (_) => false,
                    );
                  }
                }
              },
              builder: (context, state) {
                return SubmitButtonWidget(
                  textStyle: theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
                  bgColor: AppColors.primary,
                  isLoading: state is SignInLoading,
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
            ),
            TextButton(
              onPressed: () {
                AppBottomSheet.showBottomSheet(
                  initialChildSize: 0.4,
                  context,
                  AuthBottomSheet(resedPasswordCode: resedPasswordCode),
                );
              },
              child: const Text("Забыли пароль ?"),
            ),
          ],
        ),
      ),
    );
  }
}
