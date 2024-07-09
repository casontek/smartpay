
import 'package:bloc/bloc.dart';

import '../../services/sqlite_service.dart';
import '../../utils/app_status.dart';
import '../otp_verification_bloc/otp_verify_event.dart';
import '../otp_verification_bloc/otp_verify_state.dart';

class PinBloc extends Bloc<OtpVerifyEvent, OtpVerifyState> {
  final sqlService = SQLiteService();

  PinBloc() : super(const OtpVerifyState()) {

    on<KeySelection>((event, emit) async {
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

      //perform login if pin has completed and is PIN Login
      if(completeCode && event.isLogin == true) {
        emit(state.copyWith(status: Status.loading));
        String concatenatedPIN = state.otpCodes.values.join('');
        print('@@@@@@@@@@@@@@@@@@@@@@ ENTERED PIN: $concatenatedPIN');

        final userPin = await sqlService.getPIN();
        print('@@@@@@@@@@@@@@@@@@@@@@ SAVED PIN: $userPin');

        if(userPin == concatenatedPIN) {
          final user = await sqlService.getUser();
          final token = await sqlService.getToken();
          emit(state.copyWith(
              user: user,
              token: token,
              status: Status.success
          ));
        }
        else {
          emit(state.copyWith(
              status: Status.failed,
              message: 'incorrect pin.'
          ));
        }
      }
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
      print('@@@@@@@@@@@@@@@@ MY PIN: $concatenatedPIN');
      try {
        await sqlService.savePIN(concatenatedPIN);
        emit(state.copyWith(status: Status.success));
      }
      catch(e) {
        emit(state.copyWith(status: Status.failed));
      }
    });

    on<PinLogin>((event, emit) async {
      emit(state.copyWith(status: Status.loading));
      String concatenatedPIN = state.otpCodes.values.join('');
      print('@@@@@@@@@@@@@@@@@@@@@@ ENTERED PIN: $concatenatedPIN');

      final userPin = await sqlService.getPIN();
      print('@@@@@@@@@@@@@@@@@@@@@@ SAVED PIN: $userPin');

      if(userPin == concatenatedPIN) {
        final user = await sqlService.getUser();
        final token = await sqlService.getToken();
        emit(state.copyWith(
          user: user,
          token: token,
          status: Status.success
        ));
      }
      else {
        emit(state.copyWith(
          status: Status.failed,
          message: 'incorrect pin.'
        ));
      }
    });

    on<StatusReset>((event, emit) => emit(state.copyWith(status: Status.initial)));

  }

}