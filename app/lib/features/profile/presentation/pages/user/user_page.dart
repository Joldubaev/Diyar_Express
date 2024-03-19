import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/components/components.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль', style: theme.textTheme.titleSmall),
      ),
      body: const UserBody(),
    );
  }
}

class UserBody extends StatefulWidget {
  const UserBody({super.key});

  @override
  State<UserBody> createState() => _UserBodyState();
}

class _UserBodyState extends State<UserBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Form(
          child: Column(
        children: [
          const SizedBox(height: 40),
          Center(
            child: CircleAvatar(
              radius: 50,
              child: Image.asset(
                'assets/images/succes.png',
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text('User Name ', style: theme.textTheme.titleMedium),
          const SizedBox(height: 40),
          CustomInputWidget(
            title: 'User Name',
            hintText: "John Doe",
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomInputWidget(
            title: 'Phone',
            hintText: "Phone",
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ],
      )),
    );
  }
}
