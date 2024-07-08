
import 'package:bloc/bloc.dart';

import '../../utils/app_status.dart';
import '../otp_verification_bloc/otp_verify_event.dart';
import '../otp_verification_bloc/otp_verify_state.dart';

class PinBloc extends Bloc<OtpVerifyEvent, OtpVerifyState> {

  PinBloc() : super(const OtpVerifyState()) {

    on<KeySelection>((event, emit) {
      Map<int, String> keyCodes = Map.from(state.otpCodes);
      int index = state.selectedBox;
      keyCodes[index] = event.keyCode;
      //checks if user has provided complete 5 digit code
      bool completeCode = true;
      for (var entry in keyCodes.entries) {
        if (entry.value.isEmpty) {
          completeCode = false;
          break;
        }
      }
      emit(state.copyWith(
          otpCodes: keyCodes,
          selectedBox: state.selectedBox < 5 ? (state.selectedBox + 1) : state.selectedBox,
          hasCompleteOTP: completeCode
      ));
    });

    on<KeyDeletion>((event, emit) {
      Map<int, String> keyCodes = Map.from(state.otpCodes);
      keyCodes[state.selectedBox] = '';
      emit(state.copyWith(
          otpCodes: keyCodes,
          selectedBox: state.selectedBox > 1 ? (state.selectedBox - 1) : state.selectedBox,
          hasCompleteOTP: false
      ));
    });

    on<CreatePin>((event, emit) async {
      emit(state.copyWith(status: Status.loading));
      String concatenatedPIN = state.otpCodes.values.join('');


    });
  }

}