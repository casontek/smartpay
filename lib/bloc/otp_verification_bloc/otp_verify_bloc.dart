
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpaymobile/bloc/otp_verification_bloc/otp_verify_event.dart';
import 'package:smartpaymobile/bloc/otp_verification_bloc/otp_verify_state.dart';
import 'package:smartpaymobile/models/request/email_verification_request_body.dart';
import 'package:smartpaymobile/utils/app_status.dart';
import 'package:smartpaymobile/utils/request_result.dart';

import '../../services/smartpay_api_client_service.dart';

class OtpVerifyBloc extends Bloc<OtpVerifyEvent, OtpVerifyState> {
  final apiService = SmartpayApiClientService();

  OtpVerifyBloc() : super(const OtpVerifyState()) {

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

    on<BoxSelection>((event, emit) => emit(state.copyWith(selectedBox: event.boxNumber)));

    on<CodeVerification>((event, emit) async {
      emit(state.copyWith(status: Status.loading));
      String concatenatedOtp = state.otpCodes.values.join('');
      final body = EmailVerificationBody(event.email, concatenatedOtp);

      final result = await apiService.verifyEmailToken(body);
      if(result.status == NetworkStatus.success) {
        emit(state.copyWith(status: Status.success));
      }
      else {
        emit(state.copyWith(
            status: Status.failed,
            message: result.message
        ));
      }
    });
  }

}