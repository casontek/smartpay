
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_single_text_widget.dart';

class NewPasswordScreen extends StatefulWidget {

  const NewPasswordScreen({super.key});

  @override
  State<StatefulWidget> createState() => _NewPasswordScreen();

}

class _NewPasswordScreen extends State<NewPasswordScreen> {
  bool _hidePassword = true;

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
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 24.0),
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
                        customSingleTextWidget(
                            label: 'Create New Password',
                            size: 24,
                            weight: FontWeight.w600,
                            textColor: Theme.of(context).colorScheme.primary
                        ),
                        const SizedBox(height: 8.0),
                        customMultiLineTextWidget(
                            label: 'Please, enter a new password below different from the previous password',
                            size: 16,
                            weight: FontWeight.w400,
                            textColor: Theme.of(context).colorScheme.onSurface
                        ),
                        const SizedBox(height: 32.0),
                        TextFormField(
                            obscureText: _hidePassword,
                            keyboardType: TextInputType.phone,
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
                        const SizedBox(height: 16.0),
                        TextFormField(
                            obscureText: _hidePassword,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                hintText: 'Confirm password',
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
                        const SizedBox(height: 331.0),
                        customButtonWidget(
                            label: 'Create new password',
                            context: context,
                            onClick: () {
                              /*
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ForgotPasswordScreen())
                              );
                               */
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