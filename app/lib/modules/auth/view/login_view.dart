import 'dart:developer';

import 'package:diyar_express/components/components.dart';
import 'package:diyar_express/l10n/l10n.dart';
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
            Text(context.l10n.registration, style: theme.textTheme.titleLarge),
            const SizedBox(height: 30),
            CustomInputWidget(
              title: context.l10n.enterName,
              hintText: "John Doe",
              inputType: TextInputType.name,
              controller: _emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return context.l10n.enterName;
                } else if (!isNameValid(value)) {
                  return context.l10n.nameValid;
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
                  return context.l10n.phoneNumber;
                } else if (!isPhoneNumberValid(value)) {
                  return context.l10n.phoneValid;
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
                  return context.l10n.enterEmail;
                } else if (!isEmailValid(value)) {
                  return context.l10n.emailValid;
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomInputWidget(
              hintText: "********",
              title: context.l10n.password,
              controller: _passwordController,
              isPasswordField: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return context.l10n.password;
                } else if (value.length < 6 && isPasswordValid(value)) {
                  return context.l10n.policy;
                }
                return null;
              },
            ),
            const SizedBox(height: 120),
            SubmitButtonWidget(
              title: context.l10n.signIn,
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
