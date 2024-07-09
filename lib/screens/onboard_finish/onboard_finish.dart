
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartpaymobile/screens/auth/pin_login_screen.dart';
import 'package:smartpaymobile/screens/auth/sign_in_screen.dart';

import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_single_text_widget.dart';

class OnboardFinish extends StatefulWidget {
  final String username;
  final bool fromLogin;

  const OnboardFinish({
    super.key,
    required this.username,
    required this.fromLogin
  });

  @override
  State<StatefulWidget> createState() => _OnboardFinish();

}

class _OnboardFinish extends State<OnboardFinish> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).colorScheme.surface,
            statusBarIconBrightness: Brightness.dark
        ));
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
          child: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                          'assets/images/finish_thumb.png',
                          fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 32.0),
                      customMultiLineTextWidget(
                          label: 'Congratulations, ${widget.username}',
                          size: 24,
                          weight: FontWeight.w600,
                          textColor: Theme.of(context).colorScheme.primary
                      ),
                      const SizedBox(height: 8.0),
                      customMultiLineTextWidget(
                          label: widget.fromLogin ? 'You’ve created your secrete PIN' :
                          'You’ve completed the onboarding,you can start using',
                          size: 16,
                          textAlign: TextAlign.center,
                          weight: FontWeight.w400,
                          textColor: Theme.of(context).colorScheme.onSurface
                      ),
                      const SizedBox(height: 24.0),
                      customButtonWidget(
                          label: 'Get Started',
                          context: context,
                          onClick: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => widget.fromLogin ?
                                const PinLoginScreen() : const SignInScreen()),
                                    (Route<dynamic> route) => false
                            );
                          }
                      )
                    ]
                )
            )
          )
      ),
    );
  }

}