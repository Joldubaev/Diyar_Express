import 'dart:developer';

import 'package:diyar_express/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberWidget extends StatelessWidget {
  const PhoneNumberWidget({
    super.key,
    required this.number,
    required TextEditingController phoneController,
  }) : _phoneController = phoneController;

  final PhoneNumber number;
  final TextEditingController _phoneController;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.grey.withOpacity(0.1),
      ),
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber number) {
          log("${number.phoneNumber}");
        },
        onInputValidated: (bool value) {
          log("$value");
        },
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          useBottomSheetSafeArea: true,
        ),
        maxLength: 11,
        initialValue: number,
        textFieldController: _phoneController,
        formatInput: true,
        inputDecoration: InputDecoration.collapsed(
          hintText: "Номер телефона",
          hintStyle: theme.textTheme.bodyMedium!.copyWith(color: AppColors.grey),
        ),
        keyboardType: TextInputType.phone,
        onSaved: (PhoneNumber number) {
          log("$number");
        },
      ),
    );
  }
}
