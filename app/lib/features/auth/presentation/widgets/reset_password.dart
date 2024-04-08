import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/app/router/routes.gr.dart';
import 'package:diyar_express/components/components.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class RessetPasswordPage extends StatefulWidget {
  const RessetPasswordPage({super.key});

  @override
  State<RessetPasswordPage> createState() => _RessetPasswordPageState();
}

class _RessetPasswordPageState extends State<RessetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final resedPasswordCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.router.maybePop();
          },
        ),
        title: Text(
          'Восстановление пароля',
          style: theme.textTheme.titleSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              const Image(
                height: 100,
                width: 100,
                color: AppColors.primary,
                image: AssetImage("assets/images/auth_images.png"),
              ),
              const SizedBox(height: 10),
              Text(
                'Введите ваш E-Mail и код восстановления и новый пароль, который мы отправили вам на почту.',
                style: theme.textTheme.bodyLarge!.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              CustomInputWidget(
                title: 'E-Mail',
                hintText: "E-Mail",
                controller: _emailController,
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
                title: 'Новый пароль',
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
              CustomInputWidget(
                title: 'Код восстановления',
                hintText: "******",
                controller: resedPasswordCode,
                inputType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Пожалуйста, введите ваш код восстановления';
                  } else if (value.length < 5) {
                    return 'Код восстановления должен содержать не менее 5 символов';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              BlocConsumer<SignInCubit, SignInState>(
                listener: (context, state) {
                  if (state is SignInFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: const Color.fromARGB(255, 150, 33, 49),
                      ),
                    );
                  } else if (state is ResetPasswordSuccess) {
                    context.router.pushAndPopUntil(
                      const MainRoute(),
                      predicate: (_) => false,
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
                            style: theme.textTheme.bodyMedium!
                                .copyWith(color: const Color.fromARGB(255, 233, 71, 35), fontWeight: FontWeight.bold),
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
                              context.read<SignInCubit>().resetPassword(
                                      model: ResetModel(
                                    email: _emailController.text,
                                    newPassword: _passwordController.text,
                                    code: int.parse(resedPasswordCode.text),
                                  ));
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
                        context.read<SignInCubit>().resetPassword(
                              model: ResetModel(
                                email: _emailController.text,
                                newPassword: _passwordController.text,
                                code: int.parse(resedPasswordCode.text),
                              ),
                            );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
