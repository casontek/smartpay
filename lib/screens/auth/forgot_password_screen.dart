
import 'package:flutter/material.dart';
import 'package:smartpaymobile/screens/auth/verify_identity_screen.dart';

import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_single_text_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {

  const ForgotPasswordScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ForgotPasswordScreen();

}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {

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
                          width: 90.0,
                          height: 76.0,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(top: 35.0),
                          child: Image.asset('assets/images/verification_ico.png')
                        ),
                        const SizedBox(height: 24.0),
                        customSingleTextWidget(
                            label: 'Password Recovery',
                            size: 24,
                            weight: FontWeight.w600,
                            textColor: Theme.of(context).colorScheme.primary
                        ),
                        const SizedBox(height: 8.0),
                        customMultiLineTextWidget(
                            label: 'Enter your registered email below to receive password instructions',
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
                            label: 'Send me email',
                            context: context,
                            onClick: () {
                              Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context) => const VerifyIdentityScreen())
                              );
                            }
                        ),
                      ]
                  )
              )
          )
      ),
    );
  }

}