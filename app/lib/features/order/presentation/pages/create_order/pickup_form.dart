import 'package:diyar_express/components/components.dart';
import 'package:diyar_express/features/auth/presentation/widgets/phone_number.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PickupForm extends StatefulWidget {
  const PickupForm({super.key});

  @override
  State<PickupForm> createState() => _PickupFormState();
}

class _PickupFormState extends State<PickupForm> {
  final TextEditingController _phoneController = TextEditingController(text: '+996');
  PaymentType? _paymentType;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      children: [
        CustomInputWidget(
            hintText: '',
            title: 'Имя',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Пожалуйста, введите ваше имя';
              } else if (value.length < 3) {
                return 'Имя должно содержать более трех символов.';
              }
              return null;
            }),
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
        CustomInputWidget(
          hintText: '',
          title: 'Комментарий к заказу',
          validator: (value) {
            if (value!.isEmpty) {
              return 'Пожалуйста, введите ваш комментарий';
            } else if (value.length < 3) {
              return 'Комментарий должен содержать более трех символов.';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        const CustomInputWidget(
          hintText: '',
          title: 'Сдача с',
          inputType: TextInputType.number,
        ),
        const SizedBox(height: 10),
        const CustomInputWidget(
          hintText: '',
          title: 'Приготовить к',
          inputType: TextInputType.number,
        ),
        const SizedBox(height: 10),
        Text('Способ оплаты', style: theme.textTheme.bodyMedium!),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
              value: PaymentType.cash,
              groupValue: _paymentType,
              onChanged: (value) {
                setState(
                  () {
                    _paymentType = value;
                  },
                );
              },
            ),
            const Text('Наличными курьеру')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
              value: PaymentType.card,
              groupValue: _paymentType,
              onChanged: (value) {
                setState(
                  () {
                    _paymentType = value;
                  },
                );
              },
            ),
            const Text('Картой курьеру (Post terminal)')
          ],
        ),
        const SizedBox(height: 10),
        const Text('Заказ заберите по адресу'),
        Text(
          'г.Бишкек, проспект Победы, 333',
          style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16),
        ),
      ],
    );
  }
}

enum PaymentType { cash, card, online }
