import 'package:flutter/material.dart';

import '../widgets/sign_in_button.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/images/auth_images.png',
              height: screenHeight * 0.2,
            ),
          ),
        ),
      ),
      bottomSheet: _BottomSheet(screenHeight: screenHeight),
    );
  }
}

class _BottomSheet extends StatelessWidget {
  const _BottomSheet({Key? key, required this.screenHeight}) : super(key: key);
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      showDragHandle: true,
      constraints: const BoxConstraints(
            maxHeight: 0.53,
            minHeight: 0.53,
          ) *
          screenHeight,
      onClosing: () {},
      builder: (context) {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 20),
            const Center(child: Text('Добро пожаловать!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('У вас уже есть аккаунт?'),
              trailing: TextButton(onPressed: () {}, child: const Text('Войти')),
            ),
            SignInButton(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              text: 'Sign in with Google',
              iconPath: 'assets/icons/google.svg',
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            TextButton(onPressed: () {}, child: const Text('Продолжая вы соглашаетесь с политикой')),
          ],
        );
      },
    );
  }
}
