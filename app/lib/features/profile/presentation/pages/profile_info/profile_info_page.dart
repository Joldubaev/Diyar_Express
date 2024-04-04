import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/components/components.dart';
import 'package:diyar_express/features/auth/data/models/user_mpdel.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class ProfileInfoPage extends StatefulWidget {
  final UserModel user;
  const ProfileInfoPage({super.key, required this.user});

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fullNameController.text = widget.user.name ?? '';
    phoneController.text = widget.user.phone ?? '';
  }

  @override
  dispose() {
    super.dispose();
    fullNameController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Профиль', style: theme.textTheme.titleSmall)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    child: SvgPicture.asset(
                      'assets/icons/profile_icon.svg',
                      height: 100,
                      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text('${widget.user.name} ', style: theme.textTheme.titleMedium),
                const SizedBox(height: 40),
                CustomInputWidget(
                  title: 'Ваше имя',
                  hintText: "Введите ваше имя",
                  controller: fullNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomInputWidget(
                  title: 'Номер телефона',
                  hintText: "Введите ваш номер телефона",
                  controller: phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
