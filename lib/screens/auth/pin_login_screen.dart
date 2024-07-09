
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpaymobile/screens/home/home_screen.dart';
import 'package:smartpaymobile/utils/constants.dart';

import '../../bloc/create_pin/pin_bloc.dart';
import '../../bloc/otp_verification_bloc/otp_verify_event.dart';
import '../../bloc/otp_verification_bloc/otp_verify_state.dart';
import '../../utils/app_status.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_single_text_widget.dart';
import 'create_pin_screen.dart';
import 'otp_verification_screen.dart';

class PinLoginScreen extends StatefulWidget {

  const PinLoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PinLoginScreen();

}

class _PinLoginScreen extends State<PinLoginScreen> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).colorScheme.surface,
            statusBarIconBrightness: Brightness.dark
        ));
    return BlocProvider(
        create: (context) => PinBloc(),
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(
              child: BlocConsumer<PinBloc, OtpVerifyState>(
                  listener: (context, state) {
                    if(state.status == Status.failed) {
                      toastMessage(
                          message: state.message,
                          background: Colors.red,
                          textColor: Colors.white,
                          context: context
                      );
                      context.read<PinBloc>().add(StatusReset());
                    }
                    else if(state.status == Status.success) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) =>
                          HomeScreen(user: state.user!, token: state.token))
                      );
                    }
                  },
                  builder: (context, state) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Stack(
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 68.0),
                                  customSingleTextWidget(
                                      label: 'Welcome Back',
                                      size: 24,
                                      weight: FontWeight.w600,
                                      textColor: Theme.of(context).colorScheme.primary
                                  ),
                                  const SizedBox(height: 8.0),
                                  customSingleTextWidget(
                                      label: 'Enter your PIN to unlock',
                                      size: 16,
                                      weight: FontWeight.w400,
                                      textColor: Theme.of(context).colorScheme.onSurface
                                  ),
                                  const SizedBox(height: 32.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      pinInputWidget(
                                          value: '${state.otpCodes[1]}',
                                          context: context,
                                          isSelected: state.selectedBox == 1,
                                          keyPosition: 1
                                      ),
                                      pinInputWidget(
                                          value: '${state.otpCodes[2]}',
                                          context: context,
                                          isSelected: state.selectedBox == 2,
                                          keyPosition: 2
                                      ),
                                      pinInputWidget(
                                          value: '${state.otpCodes[3]}',
                                          context: context,
                                          isSelected: state.selectedBox == 3,
                                          keyPosition: 3
                                      ),
                                      pinInputWidget(
                                          value: '${state.otpCodes[4]}',
                                          context: context,
                                          isSelected: state.selectedBox == 4,
                                          keyPosition: 4
                                      ),
                                      pinInputWidget(
                                          value: '${state.otpCodes[5]}',
                                          context: context,
                                          isSelected: state.selectedBox == 5,
                                          keyPosition: 5
                                      )
                                    ],
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
                                                  context.read<PinBloc>().add(KeyDeletion());
                                                }
                                                else {
                                                  context.read<PinBloc>().add(KeySelection(
                                                      value == '11' ? '0' : value,
                                                      isLogin: true
                                                  ));
                                                }
                                              }
                                            }
                                        );
                                      })
                                  )
                                ]
                            ),
                            Positioned(
                                top: 120.0,
                                right: 0.0,
                                left: 0.0,
                                child: state.status == Status.loading ?
                                    const SizedBox(
                                      width: 25.0,
                                      height: 25.0,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.0,
                                        color: Colors.grey,
                                      )
                                    ) : const SizedBox()
                            )
                          ],
                        )
                    );
                  }
              )
          ),
        )
    );
  }

}