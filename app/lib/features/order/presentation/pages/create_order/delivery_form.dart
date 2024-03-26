import 'package:diyar_express/components/components.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../auth/presentation/widgets/phone_number.dart';

class DeliveryForm extends StatefulWidget {
  const DeliveryForm({super.key});

  @override
  State<DeliveryForm> createState() => _DeliveryFormState();
}

class _DeliveryFormState extends State<DeliveryForm> {
  final TextEditingController _phoneController = TextEditingController(text: '+996');
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _houseController = TextEditingController();
  final TextEditingController _apartmentController = TextEditingController();
  final TextEditingController _intercomController = TextEditingController();
  final TextEditingController _floorController = TextEditingController();
  final TextEditingController _entranceController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _userName = TextEditingController();

  PaymentTypeDelivery? _paymentType;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      children: [
        CustomInputWidget(
          hintText: 'Имя',
          title: 'Ваше имя',
          controller: _userName,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Пожалуйста, введите ваше имя';
            } else if (value.length < 3) {
              return 'Имя должно содержать более трех символов.';
            }
            return null;
          },
        ),
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
          title: 'Адрес',
          controller: _addressController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Пожалуйста, введите ваш адрес';
            } else if (value.length < 3) {
              return 'Адрес должен содержать более трех символов.';
            }
            return null;
          },
        ),
        CustomInputWidget(
          hintText: '',
          title: 'Номер дома',
          controller: _houseController,
          inputType: TextInputType.number,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Пожалуйста, введите номер дома';
            } else if (value.isEmpty) {
              return 'Номер дома должен содержать более одного символа.';
            }
            return null;
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: CustomInputWidget(
                hintText: '',
                title: 'Кв/Офис',
                controller: _apartmentController,
                inputType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Пожалуйста, введите номер квартиры';
                  } else if (value.isEmpty) {
                    return 'Номер квартиры должен содержать более одного символа.';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 20.0),
            Flexible(
              child: CustomInputWidget(
                  hintText: '',
                  title: 'Код домофона',
                  controller: _intercomController,
                  inputType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Пожалуйста, введите код домофона';
                    } else if (value.isEmpty) {
                      return 'Код домофона должен содержать более одного символа.';
                    }
                    return null;
                  }),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: CustomInputWidget(
                hintText: '',
                title: 'Этаж',
                controller: _floorController,
                inputType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Пожалуйста, введите номер этажа';
                  } else if (value.isEmpty) {
                    return 'Номер этажа должен содержать более одного символа.';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 20.0),
            Flexible(
              child: CustomInputWidget(
                hintText: '',
                title: 'Код домофона',
                controller: _entranceController,
                inputType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Пожалуйста, введите номер подъезда';
                  } else if (value.isEmpty) {
                    return 'Номер подъезда должен содержать более одного символа.';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        CustomInputWidget(
          hintText: '',
          title: 'Комментарий к заказу',
          controller: _commentController,
        ),
        const SizedBox(height: 10),
        Text('Способ оплаты', style: theme.textTheme.bodyMedium!),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
              value: PaymentTypeDelivery.cash,
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
              value: PaymentTypeDelivery.card,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
              value: PaymentTypeDelivery.online,
              groupValue: _paymentType,
              onChanged: (value) {
                setState(
                  () {
                    _paymentType = value;
                  },
                );
              },
            ),
            const Text('Онлайн оплата')
          ],
        ),
        const SizedBox(height: 10),
        CustomInputWidget(
            hintText: '',
            title: 'Сдача с',
            inputType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Пожалуйста, введите сумму для сдачи';
              } else if (value.isEmpty) {
                return 'Сумма для сдачи должна содержать более одного символа.';
              }
              return null;
            }),
      ],
    );
  }
}

enum PaymentTypeDelivery { cash, card, online }
