
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartpaymobile/bloc/otp_verification_bloc/otp_verify_bloc.dart';
import 'package:smartpaymobile/bloc/otp_verification_bloc/otp_verify_event.dart';
import 'package:smartpaymobile/bloc/otp_verification_bloc/otp_verify_state.dart';
import 'package:smartpaymobile/screens/detail/id_fill_screen.dart';
import 'package:smartpaymobile/utils/constants.dart';
import '../../utils/app_status.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_single_text_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String token;
  final String email;

  const OtpVerificationScreen({
    super.key,
    required this.token,
    required this.email
  });

  @override
  State<StatefulWidget> createState() => _OtpVerificationScreen();

}

class _OtpVerificationScreen extends State<OtpVerificationScreen> {

  @override
  void initState() {
    super.initState();
    showInAppMessage(context);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).colorScheme.surface,
            statusBarIconBrightness: Brightness.dark
        ));
    return BlocProvider(
        create: (context) => OtpVerifyBloc(),
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(
              child: BlocConsumer<OtpVerifyBloc, OtpVerifyState>(
                  listener: (context, state) {
                    if(state.status == Status.failed) {
                      toastMessage(
                          message: state.message,
                          background: Colors.red,
                          textColor: Colors.white,
                          context: context
                      );
                    }
                    else if(state.status == Status.success) {
                      Navigator.pushReplacement(
                          context, 
                        MaterialPageRoute(builder: (context) => IdFillScreen(email: widget.email))
                      );
                    }
                  },
                  builder: (context, state) {
                    return Padding(
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
                                      value: '${state.otpCodes[1]}',
                                      isSelected: state.selectedBox == 1,
                                      context: context,
                                      onSelected: () => context.read<OtpVerifyBloc>().add(BoxSelection(1))
                                  ),
                                  codeInputWidget(
                                      value: '${state.otpCodes[2]}',
                                      isSelected: state.selectedBox == 2,
                                      context: context,
                                      onSelected: () => context.read<OtpVerifyBloc>().add(BoxSelection(2))
                                  ),
                                  codeInputWidget(
                                      value: '${state.otpCodes[3]}',
                                      isSelected: state.selectedBox == 3,
                                      context: context,
                                      onSelected: () => context.read<OtpVerifyBloc>().add(BoxSelection(3))
                                  ),
                                  codeInputWidget(
                                      value: '${state.otpCodes[4]}',
                                      isSelected: state.selectedBox == 4,
                                      context: context,
                                      onSelected: () => context.read<OtpVerifyBloc>().add(BoxSelection(4))
                                  ),
                                  codeInputWidget(
                                      value: '${state.otpCodes[5]}',
                                      isSelected: state.selectedBox == 5,
                                      context: context,
                                      onSelected: () => context.read<OtpVerifyBloc>().add(BoxSelection(5))
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
                                  isActive: state.hasCompleteOTP,
                                  isLoading: state.status == Status.loading,
                                  context: context,
                                  onClick: () {
                                    if(state.hasCompleteOTP) {
                                      context.read<OtpVerifyBloc>().add(CodeVerification(widget.email));
                                    }
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
                                          if(value != '10') {
                                            if(value == '12') {
                                              context.read<OtpVerifyBloc>().add(KeyDeletion());
                                            }
                                            else {
                                              context.read<OtpVerifyBloc>().add(KeySelection(value == '11' ? '0' : value));
                                            }
                                          }
                                        }
                                    );
                                  })
                              )
                            ]
                        )
                    );
                  })
          ),
        )
    );
  }

  void showInAppMessage(BuildContext c) {
    Fluttertoast.showToast(
        msg: "SmartPay email verification code ${widget.token}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
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
    child: InkWell(
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