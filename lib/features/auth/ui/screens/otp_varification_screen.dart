import 'dart:async';
import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/app/app_constants.dart';
import 'package:ecommerce/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:ecommerce/features/auth/ui/widget/app_icon_widget.dart';
import 'package:ecommerce/features/common/ui/widgets/center_circular_progress_indicater.dart';
import 'package:ecommerce/features/common/ui/widgets/show_snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controller/otp_verfication_controller.dart';

class OtpVarificationScreen extends StatefulWidget {
  const OtpVarificationScreen({
    super.key,
    required this.email,
  });
  static const String name = '/otp-verification';
  final String email;
  @override
  State<OtpVarificationScreen> createState() => _OtpVarificationScreenState();
}

class _OtpVarificationScreenState extends State<OtpVarificationScreen> {
  @override
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxInt _remainingTime = AppConstants.resendOtpTimeOutInSecs.obs;
  late Timer timer;
  final RxBool _enableResendCodeButton = false.obs;
  final OtpVerficationController _otpVerificationController =
      Get.find<OtpVerficationController>();

  @override
  void initState() {
    super.initState();
    _startResendCodeTimer();
  }

  void _startResendCodeTimer() {
    _enableResendCodeButton.value = false;
    _remainingTime.value = AppConstants.resendOtpTimeOutInSecs;
    _remainingTime.value = 10;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      _remainingTime.value--;
      if (_remainingTime == 0) {
        t.cancel();
        _enableResendCodeButton.value = true;
      }
    });
  }

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
                  "Enter OTP Code",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "A 4 digit otp has been sent  to your email",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 24,
                ),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    activeColor: AppColors.themeColor,
                    selectedColor: AppColors.themeColor,
                    inactiveColor: AppColors.themeColor,
                  ),
                  keyboardType: TextInputType.number,
                  controller: _otpTEController,
                  appContext: context,
                  validator: (String? value) {
                    if (value?.length != 6) {
                      return 'Enter your Otp';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                GetBuilder<OtpVerficationController>(builder: (controller) {
                  if(controller.inProgress){
                    return const CenterCircularProgressIndicater();
                  }
                  return ElevatedButton(
                      onPressed: _onTaoNextButton,
                      child: const Text(
                        "Next",
                        style: TextStyle(color: Colors.white),
                      ));
                }),

                const SizedBox(
                  height: 24,
                ),
                //TODO: enable button when 120s is done and visible the text

                Obx(
                  () => Visibility(
                    visible: !_enableResendCodeButton.value,
                    child: RichText(
                        text: TextSpan(
                            text: 'This code will be expired in ',
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                            children: [
                          TextSpan(
                              text: '${_remainingTime}s',
                              style: const TextStyle(
                                color: AppColors.themeColor,
                              ))
                        ])),
                  ),
                ),
                Obx(() => Visibility(
                      visible: _enableResendCodeButton.value,
                      child: TextButton(
                        onPressed: () {
                          _startResendCodeTimer();
                        },
                        child: const Text('Resend Code'),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTaoNextButton() async {
    if (_formKey.currentState!.validate()) {
      final bool response = await _otpVerificationController.verifyOtp(
          widget.email, _otpTEController.text);
      if (response) {
        if (mounted) {
          Navigator.pushNamed(context, CompleteProfileScreen.name);
        }
      } else {
        if (mounted) {
          showSnackBarMessage(
              context, _otpVerificationController.errorMessage!);
        }
      }
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
