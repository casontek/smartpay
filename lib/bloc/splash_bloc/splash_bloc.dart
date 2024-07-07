
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpaymobile/bloc/splash_bloc/splash_event.dart';
import 'package:smartpaymobile/bloc/splash_bloc/splash_state.dart';

import '../../services/sqlite_service.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final sqlService = SQLiteService();

  SplashBloc() : super(const SplashState()) {
    on<CheckAccount>((event, emit) async {
      //checks if the user has been onboarded
      final hasOnBoarded = await sqlService.isOnBoarded();
      if(hasOnBoarded == true) {
        emit(state.copyWith(appState: AppState.onBoarded));
      }
      else {
        emit(state.copyWith(appState: AppState.notOnBoarded));
      }
    });
  }

}