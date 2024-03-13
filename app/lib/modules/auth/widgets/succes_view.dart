import 'package:diyar_express/components/components.dart';
import 'package:diyar_express/l10n/l10n.dart';
import 'package:diyar_express/modules/home/home.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';

class SuccesView extends StatelessWidget {
  const SuccesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 40),
        children: [
          Image.asset(
            'assets/images/succes.png',
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              context.l10n.accountCreated,
              style: theme.textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 120),
          SubmitButtonWidget(
            title: context.l10n.signIn,
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeView(),
                ),
                (route) => false,
              );
            },
            bgColor: AppColors.primary,
            textStyle: theme.textTheme.bodyLarge!.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

