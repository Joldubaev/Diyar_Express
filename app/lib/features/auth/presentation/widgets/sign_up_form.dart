import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/app/router/routes.gr.dart';
import 'package:diyar_express/components/components.dart';
import 'package:diyar_express/features/auth/data/models/sign_up_model.dart';
import 'package:diyar_express/features/auth/presentation/widgets/phone_number.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:diyar_express/utils/snackbar/snackbar_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CustomInputWidget(
            title: 'Ваше имя',
            hintText: "Асанов Асан",
            controller: _usernameController,
            isPasswordField: false,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Пожалуйста, введите ваше имя';
              } else if (value.length < 3) {
                return 'Имя должно содержать более трех символов.';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomInputWidget(
            title: 'E-Mail',
            hintText: "asanov@example.com",
            controller: _emailController,
            isPasswordField: false,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Пожалуйста, введите ваш E-Mail';
              } else if (!EmailValidator.validate(value)) {
                return 'Пожалуйста, введите корректный E-Mail адрес.';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          PhoneNumberMask(
            title: 'Номер телефона',
            hintText: '+996 (___) __-__-__',
            textController: _phoneController,
            hint: "Номер телефона",
            formatter: MaskTextInputFormatter(mask: "+996 (###) ##-##-##"),
            textInputType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Пожалуйста, введите ваш номер телефона';
              } else if (value.length < 10) {
                return 'Номер телефона должен содержать более десяти символов.';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomInputWidget(
            title: 'Пароль',
            hintText: "********",
            controller: _passwordController,
            isPasswordField: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Пожалуйста, введите ваш пароль';
              } else if (value.length < 5) {
                return 'Пароль должен содержать более пяти символов.';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomInputWidget(
            title: 'Подтвердите пароль',
            hintText: "********",
            controller: _confirmPasswordController,
            isPasswordField: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Пожалуйста, подтвердите ваш пароль';
              } else if (value != _passwordController.text) {
                return "Пароли не совпадают";
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          BlocConsumer<SignUpCubit, SignUpState>(
            listener: (_, state) {
              if (state is SignUpSuccess) {
                context.pushRoute(const SignUpSucces());
              }
            },
            builder: (context, state) {
              if (state is SignUpLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SignUpFailure) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            'Регистрация не удалась. Пожалуйста, попробуйте еще раз.',
                            style: theme.textTheme.bodySmall!.copyWith(color: AppColors.red),
                          ),
                        ),
                      ),
                    ),
                    SubmitButtonWidget(
                      isLoading: state is SignUpLoading,
                      textStyle: theme.textTheme.bodyLarge!.copyWith(color: AppColors.white),
                      bgColor: AppColors.primary,
                      title: state.message,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<SignUpCubit>(context).signUpUser(
                            UserModel(
                              name: _usernameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              phone: _phoneController.text,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                );
              }
              return SubmitButtonWidget(
                isLoading: state is SignUpLoading,
                textStyle: theme.textTheme.bodyLarge!.copyWith(color: AppColors.white),
                bgColor: AppColors.primary,
                title: 'Зарегистрироваться',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    BlocProvider.of<SignUpCubit>(context).signUpUser(
                      UserModel(
                        name: _usernameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                        phone: _phoneController.text,
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
                message: "Пока не доступно. Пожалуйста, попробуйте позже",
                context: context,
              );
            },
          ),
          TextCheckButton(
            text: "Уже есть аккаунт?",
            route: "Войти",
            onPressed: () {
              context.pushRoute(const SignInRoute());
            },
          ),
        ],
      ),
    );
  }
}
