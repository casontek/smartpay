
import 'package:flutter/material.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_single_text_widget.dart';

class OtpVerificationScreen extends StatefulWidget {

  const OtpVerificationScreen({super.key});

  @override
  State<StatefulWidget> createState() => _OtpVerificationScreen();

}

class _OtpVerificationScreen extends State<OtpVerificationScreen> {

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
                        label: 'Verify it’s you',
                        size: 24,
                        weight: FontWeight.w600,
                        textColor: Theme.of(context).colorScheme.primary
                    ),
                    const SizedBox(height: 8.0),
                    Text.rich(
                        TextSpan(
                            children: [
                              TextSpan(
                                  text: 'We send a code to (',
                                  style: TextStyle(
                                      color: Theme.of(context).colorScheme.onSurface,
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16
                                  )
                              ),
                              TextSpan(
                                text: ' *****@mail.com ',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                  text: '). Enter it here to verify your identity',
                                  style: TextStyle(
                                      color: Theme.of(context).colorScheme.onSurface,
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16
                                  )
                              ),
                            ]
                        ),
                        maxLines: 2
                    ),
                    const SizedBox(height: 32.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        codeInputWidget(
                            value: '',
                            isSelected: true,
                            context: context,
                            onSelected: () {}
                        ),
                        codeInputWidget(
                            value: '',
                            isSelected: false,
                            context: context,
                            onSelected: () {}
                        ),
                        codeInputWidget(
                            value: '',
                            isSelected: false,
                            context: context,
                            onSelected: () {}
                        ),
                        codeInputWidget(
                            value: '',
                            isSelected: false,
                            context: context,
                            onSelected: () {}
                        ),
                        codeInputWidget(
                            value: '',
                            isSelected: false,
                            context: context,
                            onSelected: () {}
                        )
                      ],
                    ),
                    const SizedBox(height: 32.0),
                    Container(
                        alignment: Alignment.center,
                        child: customSingleTextWidget(
                            label: 'Resend Code 30 secs',
                            size: 16,
                            weight: FontWeight.w700,
                            textColor: const Color(0XFF727272)
                        )
                    ),
                    const SizedBox(height: 67.0),
                    customButtonWidget(
                        label: 'Confirm',
                        context: context,
                        onClick: () {

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

Widget codeInputWidget({
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

Widget keyWidget({
  required String keyCode,
  required double keyWidth,
  required Function(String value) onClicked,
  required BuildContext context
}) {
  return Container(
    width: keyWidth,
    height: 56.0,
    alignment: Alignment.center,
    child: GestureDetector(
      onTap: () => onClicked(keyCode),
      child: keyCode == '12' ? Icon(
          Icons.backspace_outlined,
          color: Theme.of(context).colorScheme.primary
      ) :
      customSingleTextWidget(
          label: keyCode == '10' ? '*' : keyCode == '11' ? '0' : keyCode,
          size: 24,
          weight: FontWeight.w500,
          textColor: Theme.of(context).colorScheme.primary
      )
    ),
  );
}