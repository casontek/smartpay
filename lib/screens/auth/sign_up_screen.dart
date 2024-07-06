

import 'package:flutter/material.dart';
import 'package:smartpaymobile/screens/auth/sign_in_screen.dart';

import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_single_text_widget.dart';
import '../../widgets/text_button_widget.dart';

class SignUpScreen extends StatefulWidget {

  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpScreen();

}

class _SignUpScreen extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
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
                        ),
                        const SizedBox(height: 24.0),
                        Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Create a ',
                                      style: TextStyle(
                                          color: Theme.of(context).colorScheme.primary,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24
                                      )
                                  ),
                                  TextSpan(
                                    text: 'Smartpay',
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.secondary,
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24,
                                    ),
                                  ),
                                  TextSpan(
                                      text: '\naccount',
                                      style: TextStyle(
                                          color: Theme.of(context).colorScheme.primary,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24
                                      )
                                  ),
                                ]
                            )
                        ),
                        const SizedBox(height: 32.0),
                        TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                hintText: 'Email',
                                filled: true,
                                fillColor: Theme.of(context).colorScheme.surfaceTint,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).colorScheme.surfaceTint,
                                        width: 0.01
                                    )
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).colorScheme.surfaceTint,
                                        width: 0.01
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).colorScheme.outlineVariant,
                                        width: 1.0
                                    )
                                )
                            )
                        ),
                        const SizedBox(height: 24.0),
                        customButtonWidget(
                            label: 'Sign Up',
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
                              socialButtonWidget(
                                  provider: 'google',
                                  context: context,
                                  onClick: () {}
                              ),
                              socialButtonWidget(
                                  provider: 'apple',
                                  context: context,
                                  onClick: () {}
                              )
                            ]
                        ),
                        const SizedBox(height: 138.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              customSingleTextWidget(
                                  label: 'Already have an account?',
                                  size: 16,
                                  weight: FontWeight.w400,
                                  textColor: Theme.of(context).colorScheme.onSurface
                              ),
                              const SizedBox(width: 8.0),
                              textButtonWidget(
                                  label: 'Sign In',
                                  context: context,
                                  onClick: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const SignInScreen())
                                    );
                                  }
                              )
                            ]
                        ),
                        const SizedBox(height: 8.0)
                      ]
                  )
              )
          )
      ),
    );
  }

}