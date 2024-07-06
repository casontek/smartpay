
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState()  => _SplashScreen();

}

class _SplashScreen extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                  'assets/images/smartpay_logo.png',
                  fit: BoxFit.contain,
                  height: 72,
                  width: 72
              ),
              const SizedBox(height: 10.0),
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
    );
  }

}