import 'dart:async';
import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/app/app_constants.dart';
import 'package:ecommerce/features/auth/ui/widget/app_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVarificationScreen extends StatefulWidget {
  const OtpVarificationScreen({super.key});
  static const String name = '/otp-verification';
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
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    )),
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
                  child:TextButton(
                  onPressed: () {
                    _startResendCodeTimer();
                  },
                  child: const Text('Resend Code'),
                ),)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
