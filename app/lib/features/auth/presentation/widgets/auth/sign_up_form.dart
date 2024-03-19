import 'dart:developer';

import 'package:diyar_express/app/pages/pages.dart';
import 'package:diyar_express/components/buttons/google_button.dart';
import 'package:diyar_express/components/buttons/text_check_button.dart';
import 'package:diyar_express/components/components.dart';
import 'package:diyar_express/components/loading/line_or_wid.dart';
import 'package:diyar_express/features/auth/data/models/sign_up_model.dart';
import 'package:diyar_express/features/auth/presentation/presentation.dart';
import 'package:diyar_express/theme/theme.dart';
import 'package:diyar_express/utils/snackbar/snackbar_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool isVisible = false;
  String initialCountry = 'KG';
  PhoneNumber number = PhoneNumber(isoCode: 'KG');
  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number = await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'KG');
    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CustomInputWidget(
            title: 'User Name',
            hintText: "John Doe",
            controller: _usernameController,
            isPasswordField: false,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your User Name';
              } else if (value.length < 3) {
                return 'User Name must be at least 3 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          Card(
            margin: EdgeInsets.zero,
            color: const Color.fromARGB(255, 254, 251, 251),
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
              ignoreBlank: false,
              maxLength: 11,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: const TextStyle(color: Colors.black),
              initialValue: number,
              textFieldController: _phoneController,
              formatInput: true,
              inputDecoration: const InputDecoration.collapsed(
                  hintText: "Phone Number", hintStyle: TextStyle(fontSize: 16, color: Colors.black)),
              keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
              onSaved: (PhoneNumber number) {
                log("$number");
              },
            ),
          ),
          const SizedBox(height: 10),
          CustomInputWidget(
            title: 'E-Mail',
            hintText: "asanov@example.com",
            controller: _emailController,
            isPasswordField: false,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your E-Mail';
              } else if (!EmailValidator.validate(value)) {
                return 'Please enter a valid E-Mail';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomInputWidget(
            title: 'Password',
            hintText: "********",
            controller: _passwordController,
            isPasswordField: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              } else if (value.length < 5) {
                return 'The password must contains more than five characters.';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomInputWidget(
            title: 'Confirm Password',
            hintText: "********",
            controller: _confirmPasswordController,
            isPasswordField: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password confirmation';
              } else if (value != _passwordController.text) {
                return "Password doesn't match.";
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          BlocConsumer<SignUpCubit, SignUpState>(
            listener: (_, state) {
              if (state is SignUpSuccess) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                  (route) => false,
                );
              }
            },
            builder: (context, state) {
              if (state is SignUpLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SignUpFailure) {
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    SubmitButtonWidget(
                      isLoading: state is SignUpLoading,
                      textStyle: theme.textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                      ),
                      bgColor: AppColors.primary,
                      title: state.message,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          getPhoneNumber(_phoneController.text);
                          BlocProvider.of<SignUpCubit>(context).signUpUser(
                            UserModel(
                                name: _usernameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                                phone: number.phoneNumber),
                          );
                        }
                      },
                    ),
                  ],
                );
              }
              return SubmitButtonWidget(
                isLoading: state is SignUpLoading,
                textStyle: theme.textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                ),
                bgColor: AppColors.primary,
                title: 'Sign Up',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    getPhoneNumber(_phoneController.text);
                    BlocProvider.of<SignUpCubit>(context).signUpUser(
                      UserModel(
                          name: _usernameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                          phone: number.phoneNumber),
                    );
                  }
                },
              );
            },
          ),
          const LineOrWidget(),
          GoogleButton(
            color: AppColors.primary,
            onPressed: () {
              SnackBarMessage().showErrorSnackBar(
                message: "Google Sign In is not implemented yet.",
                context: context,
              );
            },
          ),
          TextCheckButton(
            text: "Already have an account? ",
            route: "Sign In",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
