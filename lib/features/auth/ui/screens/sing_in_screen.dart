import 'package:ecommerce/features/auth/ui/controller/sign_in_controller.dart';
import 'package:ecommerce/features/auth/ui/screens/otp_varification_screen.dart';
import 'package:ecommerce/features/auth/ui/widget/app_icon_widget.dart';
import 'package:ecommerce/features/common/ui/widgets/center_circular_progress_indicater.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/ui/screens/main_bottom_nav_screen.dart';
import '../../../common/ui/widgets/show_snackbar_message.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String name = '/sign-in';
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignInController _signInController =
      Get.find<SignInController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const AppLogoWidget(),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "Please enter your email address",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your email address';
                    }

                    return null;
                  },
                  controller: _emailTEController,
                  decoration: const InputDecoration(hintText: 'Email Address'),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _passwordTEController,
                  decoration: const InputDecoration(hintText: 'Password'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                GetBuilder<SignInController>(builder: (controller) {
                  if (controller.inProgress) {
                    return const CenterCircularProgressIndicater();
                  }
                  return ElevatedButton(
                    onPressed: _onTapNextButton,
                    child: const Text('Sign In'),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapNextButton() async {
    if (_formKey.currentState!.validate()) {
      bool isSuccess = await _signInController.signIn(
        _emailTEController.text.trim(),
        _passwordTEController.text,
      );
      if (isSuccess) {
        if (mounted) {
          Navigator.pushNamed(
            context,
              MainBottomNavScreen.name,
            arguments: _emailTEController.text.trim(),
          );
        }
      } else {
        if (mounted) {
          showSnackBarMessage(context, _signInController.errorMessage!);
        }
      }
    }
  }
}
