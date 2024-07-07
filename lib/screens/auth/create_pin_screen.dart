
import 'package:flutter/material.dart';

import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_single_text_widget.dart';
import 'otp_verification_screen.dart';

class CreatePinScreen extends StatefulWidget {

  const CreatePinScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CreatePinScreen();

}

class _CreatePinScreen extends State<CreatePinScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
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
                    customSingleTextWidget(
                        label: 'Set your PIN code',
                        size: 24,
                        weight: FontWeight.w600,
                        textColor: Theme.of(context).colorScheme.primary
                    ),
                    const SizedBox(height: 8.0),
                    customMultiLineTextWidget(
                        label: 'We use state-of-the-art security measures to protect your information at all times',
                        size: 16,
                        weight: FontWeight.w400,
                        textColor: Theme.of(context).colorScheme.onSurface
                    ),
                    const SizedBox(height: 32.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        pinInputWidget(
                            value: '',
                            isSelected: true,
                            context: context,
                            onSelected: () {}
                        ),
                        pinInputWidget(
                            value: '',
                            isSelected: false,
                            context: context,
                            onSelected: () {}
                        ),
                        pinInputWidget(
                            value: '',
                            isSelected: false,
                            context: context,
                            onSelected: () {}
                        ),
                        pinInputWidget(
                            value: '',
                            isSelected: false,
                            context: context,
                            onSelected: () {}
                        ),
                        pinInputWidget(
                            value: '',
                            isSelected: false,
                            context: context,
                            onSelected: () {}
                        )
                      ],
                    ),
                    const SizedBox(height: 123.0),
                    customButtonWidget(
                        label: 'Create PIN',
                        context: context,
                        onClick: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CreatePinScreen())
                          );
                        }
                    ),
                    const SizedBox(height: 36.0),
                    Wrap(
                        spacing: 0.0,
                        runSpacing: 8.0,
                        alignment: WrapAlignment.center,
                        children: List.generate(12, (index) {
                          return keyWidget(
                              keyCode: '${index + 1}',
                              keyWidth: (MediaQuery.of(context).size.width - 48)/3,
                              context: context,
                              onClicked: (value) {
                              }
                          );
                        })
                    )
                  ]
              )
          )
      ),
    );
  }

}

Widget pinInputWidget({
  required String value,
  required bool isSelected,
  required Function onSelected,
  required BuildContext context
}) {
  return GestureDetector(
      onTap: () => onSelected(),
      child: Container(
          width: 56.0,
          height: 56.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.fromBorderSide(
                  BorderSide(
                      color: isSelected ? Theme.of(context).colorScheme.secondary :
                      Theme.of(context).colorScheme.surfaceTint,
                      width: 1.0
                  )
              ),
              color: Theme.of(context).colorScheme.surfaceTint
          ),
          child: customSingleTextWidget(
              label: value,
              size: 24,
              weight: FontWeight.w700,
              textColor: Theme.of(context).colorScheme.primary
          )
      )
  );
}