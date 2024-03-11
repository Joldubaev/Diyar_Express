import 'dart:developer';

import 'package:diyar_express/components/components.dart';
import 'package:diyar_express/modules/modules.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:diyar_express/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: LoginBody(PageController()),
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody(this.controller, {super.key});

  final PageController controller;

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 90, 16, 2),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            Text('Регистрация!', style: theme.textTheme.titleLarge),
            const SizedBox(height: 30),
            CustomInputWidget(
              title: 'Your full name',
              hintText: "John Doe",
              inputType: TextInputType.name,
              controller: _emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your full name';
                } else if (!isNameValid(value)) {
                  return 'Please enter a full name.';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomInputWidget(
              title: 'Phone number',
              hintText: "+998901234567",
              inputType: TextInputType.phone,
              controller: _emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Пожалуйста, введите номер телефона.';
                } else if (!isPhoneNumberValid(value)) {
                  return 'Пожалуйста, введите корректный номер телефона.';
                }
                return null;
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
            const SizedBox(height: 120),
            SubmitButtonWidget(
              title: "Войти",
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  log('Email: ${_emailController.text}');
                  log('Password: ${_passwordController.text}');
                }
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SuccesView()));
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
  }
}
