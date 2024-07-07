
import 'package:flutter/material.dart';

import '../../widgets/custom_button_widget.dart';

class IdFillScreen extends StatefulWidget {

  const IdFillScreen({super.key});

  @override
  State<StatefulWidget> createState() => _IdFillScreen();

}

class _IdFillScreen extends State<IdFillScreen> {
  bool _hidePassword = true;

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
                        Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
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
                            )
                        ),
                        const SizedBox(height: 24.0),
                        Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Hey there! tell us a bit about',
                                      style: TextStyle(
                                          color: Theme.of(context).colorScheme.primary,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24
                                      )
                                  ),
                                  TextSpan(
                                    text: 'yourself',
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.secondary,
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                    ),
                                  )
                                ]
                            ),
                            maxLines: 2
                        ),
                        const SizedBox(height: 32.0),
                        TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                hintText: 'Full name',
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
                        const SizedBox(height: 16.0),
                        TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                hintText: 'Username',
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
                        const SizedBox(height: 16.0),
                        TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                hintText: 'Select Country',
                                filled: true,
                                enabled: false,
                                suffixIcon: const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Color(0XFF6B7280)
                                ),
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
                        const SizedBox(height: 16.0),
                        TextFormField(
                            obscureText: _hidePassword,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                filled: true,
                                suffixIcon: GestureDetector(
                                    child: Icon(
                                        _hidePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                                    onTap: () {
                                      setState(() {
                                        _hidePassword = !_hidePassword;
                                      });
                                    }
                                ),
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
                            label: 'Continue',
                            context: context,
                            onClick: () {

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