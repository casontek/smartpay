
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpaymobile/bloc/create_pin/pin_bloc.dart';
import 'package:smartpaymobile/bloc/otp_verification_bloc/otp_verify_state.dart';

import '../../bloc/otp_verification_bloc/otp_verify_event.dart';
import '../../models/user.dart';
import '../../utils/app_status.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_single_text_widget.dart';
import '../onboard_finish/onboard_finish.dart';
import 'otp_verification_screen.dart';

class CreatePinScreen extends StatefulWidget {
  final User user;
  final String token;
  final bool fromLogin;

  const CreatePinScreen({
    super.key,
    required this.user,
    required this.token,
    required this.fromLogin
  });

  @override
  State<StatefulWidget> createState() => _CreatePinScreen();

}

class _CreatePinScreen extends State<CreatePinScreen> {

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
                    if(state.status == Status.success) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              OnboardFinish(
                                username: '${widget.user.username}',
                                fromLogin: widget.fromLogin
                              )
                          )
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
                              const SizedBox(height: 123.0),
                              customButtonWidget(
                                  label: 'Create PIN',
                                  isActive: state.hasCompleteOTP,
                                  isLoading: state.status == Status.loading,
                                  context: context,
                                  onClick: () {
                                    if(state.hasCompleteOTP) {
                                      context.read<PinBloc>().add(CreatePin());
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
                                              context.read<PinBloc>().add(KeyDeletion());
                                            }
                                            else {
                                              context.read<PinBloc>().add(KeySelection(value == '11' ? '0' : value));
                                            }
                                          }
                                        }
                                    );
                                  })
                              )
                            ]
                        )
                    );
                  }
              )
          ),
        )
    );
  }

}

Widget pinInputWidget({
  required String value,
  required bool isSelected,
  required int keyPosition,
  required BuildContext context
}) {
  return SizedBox(
      width: 48.0,
      height: 56.0,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Center(
                    child: value.isNotEmpty ? Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: (isSelected && keyPosition != 5 ) ? Theme.of(context).colorScheme.secondary : Colors.black
                      ),
                    ) :
                    isSelected ? Container(
                      width: 2,
                      height: 18,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Theme.of(context).colorScheme.secondary
                      ),
                    ) : null
                )
            ),
            Container(
              width: double.infinity,
              height: 3.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Theme.of(context).colorScheme.secondary
              ),
            )
          ],
        )
      )
  );
}