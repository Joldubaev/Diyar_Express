import 'package:diyar_express/app/pages/main_home/home_page.dart';
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

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomInputWidget(
              title: 'E-Mail',
              hintText: "E-Mail",
              controller: _usernameController,
              isPasswordField: false,
              inputType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your E-Mail';
                } else if (!EmailValidator.validate(value)) {
                  return 'Please enter a valid E-Mail';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomInputWidget(
              title: 'Password',
              hintText: "Password",
              controller: _passwordController,
              isPasswordField: true,
              inputType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                } else if (value.length < 5) {
                  return 'The password must contains more than five characters.';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            BlocConsumer<SignInCubit, SignInState>(
              listener: (context, state) {
                if (state is SignInFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: const Color.fromARGB(255, 150, 33, 49),
                    ),
                  );
                } else if (state is SignInSuccessWithUser) {
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
                if (state is SignInLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SignInFailure) {
                  return Column(
                    children: [
                      Center(
                        child: Text(
                          'Sign In',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: const Color.fromARGB(255, 233, 71, 35),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SubmitButtonWidget(
                        textStyle: theme.textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                        ),
                        bgColor: AppColors.primary,
                        title: 'Sign In',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<SignInCubit>().signInUser(
                                  UserModel(
                                    email: _usernameController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                          }
                        },
                      ),
                    ],
                  );
                }

                return SubmitButtonWidget(
                  textStyle: theme.textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
                  bgColor: AppColors.primary,
                  title: 'Sign In',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<SignInCubit>().signInUser(
                            UserModel(
                              email: _usernameController.text,
                              password: _passwordController.text,
                            ),
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
                }),
            TextCheckButton(
              text: "Don't have an account? ",
              route: "Sign Up",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpPage(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
