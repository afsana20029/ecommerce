import 'package:ecommerce/app/app_themeData.dart';
import 'package:ecommerce/app/controller_binder.dart';
import 'package:ecommerce/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/email_verification_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/otp_varification_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/splash_screen.dart';
import 'package:ecommerce/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      initialBinding: ControllerBinder(),
      routes: {
        '/': (context) => const SplashScreen(),
        EmailVerificationScreen.name: (context) =>
            const EmailVerificationScreen(),
        OtpVarificationScreen.name: (context) =>
            const OtpVarificationScreen(),
        CompleteProfileScreen.name: (context) =>
        const CompleteProfileScreen(),
        HomeScreen.name: (context) => const HomeScreen(),
        MainBottomNavScreen.name: (context) => const MainBottomNavScreen(),
      },
    );
  }
}
