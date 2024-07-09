
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpaymobile/bloc/login_bloc/login_event.dart';
import 'package:smartpaymobile/bloc/login_bloc/login_state.dart';
import 'package:smartpaymobile/models/request/login_request_body.dart';
import 'package:smartpaymobile/utils/request_result.dart';

import '../../services/smartpay_api_client_service.dart';
import '../../services/sqlite_service.dart';
import '../../utils/app_status.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final apiService = SmartpayApiClientService();
  final sqlService = SQLiteService();

  LoginBloc() : super(const LoginState()) {
    on<EmailChange>((event, emit) => emit(state.copyWith(email: event.email)));

    on<PasswordChange>((event, emit) => emit(state.copyWith(password: event.password)));

    on<ResetStatus>((event, emit) => emit(state.copyWith(status: Status.initial)));

    on<UserLogin>((event, emit) async {
      //login user
      emit(state.copyWith(status: Status.loading));
      //creates login body
      final body = LoginRequestBody(event.email, event.password, 'mobile');
      final result = await apiService.userLogin(body);
      if(result.status == NetworkStatus.success) {
        final token = result.data?.token;
        final user = result.data?.user;
        //checks user information
        if(user != null && token != null) {
          //save user information on db
          await sqlService.saveToken(token);
          await sqlService.saveUser(user);

          final pin = await sqlService.getPIN();
          emit(state.copyWith(
              status: pin == null ? Status.createPIN : Status.success,
              token: token,
              user: user
          ));
        }
        else {
          emit(state.copyWith(
              status: Status.failed,
              message: 'credentials not found.'
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