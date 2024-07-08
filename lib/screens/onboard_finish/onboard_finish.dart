
import 'package:flutter/material.dart';

import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_single_text_widget.dart';

class OnboardFinish extends StatefulWidget {
  final String username;

  const OnboardFinish({super.key, required this.username});

  @override
  State<StatefulWidget> createState() => _OnboardFinish();

}

class _OnboardFinish extends State<OnboardFinish> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customSingleTextWidget(
                            label: 'Congratulations, ${widget.username}',
                            size: 24,
                            weight: FontWeight.w600,
                            textColor: Theme.of(context).colorScheme.primary
                        ),
                        const SizedBox(height: 8.0),
                        customMultiLineTextWidget(
                            label: 'You’ve completed the onboarding,you can start using',
                            size: 16,
                            weight: FontWeight.w400,
                            textColor: Theme.of(context).colorScheme.onSurface
                        ),
                        const SizedBox(height: 24.0),
                        customButtonWidget(
                            label: 'Get Started',
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