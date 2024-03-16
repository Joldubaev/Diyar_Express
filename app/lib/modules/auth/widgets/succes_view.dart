import 'package:diyar_express/components/components.dart';
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
              'Аккаунт успешно создан!',
              style: theme.textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 120),
          SubmitButtonWidget(
            title: "Войти",
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
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
