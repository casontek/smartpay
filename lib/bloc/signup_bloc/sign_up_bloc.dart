
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpaymobile/bloc/signup_bloc/sign_up_event.dart';
import 'package:smartpaymobile/bloc/signup_bloc/sign_up_state.dart';
import 'package:smartpaymobile/models/request/email_request_body.dart';

import '../../services/smartpay_api_client_service.dart';
import '../../utils/app_status.dart';
import '../../utils/request_result.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final apiService = SmartpayApiClientService();

  SignUpBloc() : super(const SignUpState()) {

    on<EmailChange>((event, emit) => emit(state.copyWith(email: event.email)));

    on<EmailToken>((event, emit) async {
      //request email token
      emit(state.copyWith(status: Status.loading));
      //creates request body
      final body = EmailRequestBody(state.email);

      final result = await apiService.getEmailToken(body);
      if(result.status == NetworkStatus.success) {
        final token = result.data?.token;
        //checks user information
        if(token != null) {
          emit(state.copyWith(
              status: Status.success,
              token: token
          ));
        }
        else {
          emit(state.copyWith(
              status: Status.failed,
              message: 'failed. try again!'
          ));
        }
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