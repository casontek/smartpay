
import 'package:flutter/material.dart';
import 'package:smartpaymobile/screens/splashscreen/splash_screen.dart';
import 'package:smartpaymobile/theme/theme_data.dart';

void main() {
  runApp(const SmartPay());
}

class SmartPay extends StatelessWidget {
  const SmartPay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getLightTheme(),
      themeMode: ThemeMode.light,
      home: const SplashScreen()
    );
  }
}

