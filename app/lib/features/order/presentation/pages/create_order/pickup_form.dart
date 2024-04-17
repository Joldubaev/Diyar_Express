import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/core/router/routes.gr.dart';
import 'package:diyar_express/shared/components/components.dart';
import 'package:diyar_express/features/auth/presentation/widgets/phone_number.dart';
import 'package:diyar_express/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PickupForm extends StatefulWidget {
  const PickupForm({super.key});

  @override
  State<PickupForm> createState() => _PickupFormState();
}

class _PickupFormState extends State<PickupForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController(text: '+996');
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          CustomInputWidget(
              hintText: 'Asanov A.A.',
              title: 'Ваше имя',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Пожалуйста, введите ваше имя';
                } else if (value.length < 3) {
                  return 'Имя должно содержать более трех символов.';
                }
                return null;
              }),
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
          const CustomInputWidget(hintText: 'Ваша еда очень вкусная ...', title: 'Комментарий к заказу'),
          const SizedBox(height: 10),
          const CustomInputWidget(
            hintText: '',
            title: 'Сдача с',
            inputType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          const CustomInputWidget(
            hintText: '18:00 | 12.12.2021',
            title: 'Приготовить к',
            inputType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          const Text('Заказ можете забрать по адресу'),
          Text(
            'г.Бишкек, проспект Победы, 333',
            style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 10),
          SubmitButtonWidget(
              title: 'Оформить заказ',
              bgColor: theme.primaryColor,
              textStyle: theme.textTheme.bodyMedium!.copyWith(color: Colors.white),
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  context.router.push(const OrderSuccess());
                }
                context.router.push(const OrderSuccess());
              }),
        ],
      ),
    );
  }
}

enum PaymentType { cash, card, online }
