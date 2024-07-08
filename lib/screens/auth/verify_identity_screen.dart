
import 'package:flutter/material.dart';
import 'package:smartpaymobile/screens/detail/id_fill_screen.dart';

import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_single_text_widget.dart';

class VerifyIdentityScreen extends StatefulWidget {

  const VerifyIdentityScreen({super.key});

  @override
  State<StatefulWidget> createState()  => _VerifyIdentityScreen();

}

class _VerifyIdentityScreen extends State<VerifyIdentityScreen> {
  final _controller = TextEditingController(text: "A*******@mail.com");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(top: 40.0),
                                child: Container(
                                    width: 90.0,
                                    height: 76.0,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(top: 35.0),
                                    child: Image.asset('assets/images/identity_user.png')
                                )
                            ),
                            const SizedBox(height: 18.0),
                            customSingleTextWidget(
                                label: 'Verify your identity',
                                size: 24,
                                weight: FontWeight.w600,
                                textColor: Theme.of(context).colorScheme.primary
                            ),
                            const SizedBox(height: 8.0),
                            Text.rich(
                                TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Where would you like Smartpay to send your security code?',
                                          style: TextStyle(
                                              color: Theme.of(context).colorScheme.primary,
                                              fontFamily: 'SF Pro Display',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16
                                          )
                                      ),
                                      TextSpan(
                                        text: 'Smartpay ',
                                        style: TextStyle(
                                          color: Theme.of(context).colorScheme.secondary,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                      TextSpan(
                                          text: 'to send your security code?',
                                          style: TextStyle(
                                              color: Theme.of(context).colorScheme.primary,
                                              fontFamily: 'SF Pro Display',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16
                                          )
                                      )
                                    ]
                                ),
                                maxLines: 2
                            ),
                            const SizedBox(height: 32.0),
                            TextFormField(
                                controller: _controller,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                enabled: false,
                                decoration: InputDecoration(
                                    filled: true,
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).colorScheme.primary
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(vertical: 24.0),
                                    prefixIcon: Icon(
                                        Icons.check_circle,
                                        color: Theme.of(context).colorScheme.secondary
                                    ),
                                    suffixIcon: const Icon(Icons.mail_outline_rounded),
                                    floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                            )
                          ]
                      )
                  ))
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
                  child: customButtonWidget(
                      label: 'Continue',
                      context: context,
                      onClick: () {
                      }
                  )
              )
            ]
          )
      )
    );
  }

}