import 'package:ecommerce/features/auth/ui/screens/sing_in_screen.dart';
import 'package:ecommerce/features/auth/ui/widget/app_icon_widget.dart';

import 'package:ecommerce/features/common/ui/screens/main_bottom_nav_screen.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, SignInScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Spacer(), AppLogoWidget(), Spacer()],
          ),
        ),
      ),
    );
  }
}
