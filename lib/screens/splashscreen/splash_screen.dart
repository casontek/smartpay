
import 'package:flutter/material.dart';
import 'package:smartpaymobile/screens/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState()  => _SplashScreen();

}

class _SplashScreen extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 15), 
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnBoardingScreen())
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                    'assets/images/smartpay_logo.png',
                    fit: BoxFit.contain,
                    height: 72,
                    width: 72
                ),
                const SizedBox(height: 16.0),
                Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(
                              text: 'Smart',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 32
                              )
                          ),
                          TextSpan(
                            text: 'Pay.',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w600,
                              fontSize: 32,
                            ),
                          ),
                        ]
                    )
                )
              ]
          )
        )
    );
  }

}