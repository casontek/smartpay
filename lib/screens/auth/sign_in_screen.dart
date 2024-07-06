
import 'package:flutter/material.dart';
import 'package:smartpaymobile/widgets/custom_button_widget.dart';
import 'package:smartpaymobile/widgets/custom_single_text_widget.dart';
import 'package:smartpaymobile/widgets/text_button_widget.dart';

class SignInScreen extends StatefulWidget {

  const SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignInScreen();

}

class _SignInScreen extends State<SignInScreen> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        leading: Container(
          width: 40.0,
          height: 40.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.fromBorderSide(BorderSide(
              color: Theme.of(context).colorScheme.outline,
              width: 1.0
            ))
          ),
          child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Theme.of(context).colorScheme.primary
          ),
        )
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 24.0),
              customSingleTextWidget(
                  label: 'Hi There! 👋',
                  size: 24,
                  weight: FontWeight.w600,
                  textColor: Theme.of(context).colorScheme.primary
              ),
              const SizedBox(height: 8.0),
              customSingleTextWidget(
                  label: 'Welcome back, Sign in to your account',
                  size: 16,
                  weight: FontWeight.w400,
                  textColor: Theme.of(context).colorScheme.onSurface
              ),
              const SizedBox(height: 32.0),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surfaceTint,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 1.0
                    )
                  )
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                obscureText: _hidePassword,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    suffixIcon: GestureDetector(
                        child: Icon(
                            _hidePassword ? Icons.visibility_rounded : Icons.visibility_off_rounded),
                        onTap: () {
                            setState(() {
                              _hidePassword = !_hidePassword;
                            });
                        }
                    ),
                    fillColor: Theme.of(context).colorScheme.surfaceTint,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 1.0
                        )
                    )
                )
              ),
              const SizedBox(height: 24.0),
              textButtonWidget(
                  label: 'Forgot Password?',
                  context: context,
                  onClick: () {}
              ),
              const SizedBox(height: 24.0),
              customButtonWidget(
                  label: 'Sign In',
                  context: context,
                  onClick: () {}
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 32.0, bottom: 24.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                              width: double.infinity,
                              height: 1,
                              color: Theme.of(context).colorScheme.outline
                          )
                      ),
                      const SizedBox(width: 12.0),
                      customSingleTextWidget(
                          label: 'OR',
                          size: 14,
                          weight: FontWeight.w400,
                          textColor: Theme.of(context).colorScheme.onSurface
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                          child: Container(
                              width: double.infinity,
                              height: 1,
                              color: Theme.of(context).colorScheme.outline
                          )
                      )
                    ],
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _socialButtonWidget(
                      provider: 'google',
                      context: context,
                      onClick: () {}
                  ),
                  _socialButtonWidget(
                      provider: 'apple',
                      context: context,
                      onClick: () {}
                  )
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customSingleTextWidget(
                      label: 'Don’t have an account?',
                      size: 16,
                      weight: FontWeight.w400,
                      textColor: Theme.of(context).colorScheme.onSurface
                  ),
                  const SizedBox(width: 8.0),
                  textButtonWidget(
                      label: 'Sign Up',
                      context: context,
                      onClick: () {}
                  )
                ]
              )
            ],
          )
        )
      ),
    );
  }

}


Widget _socialButtonWidget({
  required String provider,
  required BuildContext context,
  required Function onClick
}) {
  return Container(
    width: 155,
    height: 56,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.0),
      border: Border.fromBorderSide(
        BorderSide(
          color: Theme.of(context).colorScheme.outline,
          width: 1.0
        )
      )
    ),
    child: Image.asset(provider == 'google' ? 'assets/images/google_logo.png' :
    'assets/images/apple_logo.png')
  );
}