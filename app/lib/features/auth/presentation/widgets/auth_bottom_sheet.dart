import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/core/router/routes.gr.dart';
import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/shared/components/components.dart';
import 'package:diyar_express/features/features.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:diyar_express/shared/utils/utils.dart';
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
          Text(context.l10n.enterEmail),
          const SizedBox(height: 10),
          CustomInputWidget(
            title: context.l10n.email,
            hintText: context.l10n.email,
            controller: resedPasswordCode,
            isPasswordField: false,
            inputType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return context.l10n.pleaseEnterEmail;
              } else if (!EmailValidator.validate(value)) {
                return context.l10n.pleaseEnterCorrectEmail;
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          SubmitButtonWidget(
            textStyle: theme.textTheme.bodyLarge!.copyWith(
              color: AppColors.white,
            ),
            bgColor: AppColors.primary,
            title: context.l10n.send,
            onTap: () {
              context.read<SignInCubit>().sendCodeToEmail(resedPasswordCode.text);
              if (resedPasswordCode.text.isNotEmpty) {
                context.router.replace(const RessetPasswordRoute());
              } else {
                SnackBarMessage().showErrorSnackBar(
                  message: context.l10n.pleaseEnterEmail,
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
