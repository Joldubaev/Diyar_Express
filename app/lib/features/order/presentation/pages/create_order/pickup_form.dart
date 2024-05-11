import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/core/router/routes.gr.dart';
import 'package:diyar_express/l10n/l10n.dart';
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
              hintText: context.l10n.nameExample,
              title: context.l10n.yourName,
              validator: (value) {
                if (value!.isEmpty) {
                  return context.l10n.pleaseEnterName;
                } else if (value.length < 3) {
                  return context.l10n.pleaseEnterCorrectName;
                }
                return null;
              }),
          const SizedBox(height: 10),
          PhoneNumberMask(
            title: context.l10n.phone,
            hintText: '+996 (___) __-__-__',
            textController: _phoneController,
            hint: context.l10n.phone,
            formatter: MaskTextInputFormatter(mask: "+996 (###) ##-##-##"),
            textInputType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return context.l10n.pleaseEnterPhone;
              } else if (value.length < 10) {
                return context.l10n.pleaseEnterCorrectPhone;
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomInputWidget(hintText: 'Ваша еда очень вкусная ...', title: context.l10n.comment),
          const SizedBox(height: 10),
          CustomInputWidget(
            hintText: '',
            title: context.l10n.change,
            inputType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          CustomInputWidget(
            hintText: '18:00 | 12.12.2021',
            title: context.l10n.preparingForThe,
            inputType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          Text(context.l10n.orderPickupAd, style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16)),
          Text(
            context.l10n.address,
            style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 10),
          SubmitButtonWidget(
              title: context.l10n.orderHistory,
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
