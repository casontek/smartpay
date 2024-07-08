
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpaymobile/bloc/user_fill_bloc/fill_event.dart';
import 'package:smartpaymobile/bloc/user_fill_bloc/fill_state.dart';
import 'package:smartpaymobile/models/request/registration_request_body.dart';

import '../../services/smartpay_api_client_service.dart';
import '../../utils/app_status.dart';
import '../../utils/request_result.dart';

class FillBloc extends Bloc<FillEvent, FillState> {
  final apiService = SmartpayApiClientService();

  FillBloc() : super(const FillState()) {

    on<NameChange>((event, emit) => emit(state.copyWith(names: event.name)));

    on<UsernameChange>((event, emit) => emit(state.copyWith(username: event.username)));

    on<CountryChange>((event, emit) => emit(state.copyWith(country: event.country, code: event.code)));

    on<PasswordChange>((event, emit) => emit(state.copyWith(password: event.password)));

    on<UpdateProfile>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      final body = RegistrationRequestBody(
          state.names,
          state.username,
          event.email,
          state.code,
          state.password,
          'mobile'
      );

      final result = await apiService.registerProfile(body);
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