import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/app/router/routes.gr.dart';
import 'package:diyar_express/components/components.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:diyar_express/utils/utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBottomSheet extends StatelessWidget {
  const AuthBottomSheet({super.key, required this.resedPasswordCode});

  final TextEditingController resedPasswordCode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Text("Введите ваш E-Mail"),
          const SizedBox(height: 10),
          CustomInputWidget(
            title: 'E-Mail',
            hintText: "E-Mail",
            controller: resedPasswordCode,
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
          SubmitButtonWidget(
            textStyle: theme.textTheme.bodyLarge!.copyWith(
              color: Colors.white,
            ),
            bgColor: AppColors.primary,
            title: 'Отправить',
            onTap: () {
              context.read<SignInCubit>().sendCodeToEmail(resedPasswordCode.text);
              if (resedPasswordCode.text.isNotEmpty) {
                context.router.replace(const RessetPasswordRoute());
              } else {
                SnackBarMessage().showErrorSnackBar(
                  message: "Пожалуйста, введите ваш E-Mail",
                  context: context,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
