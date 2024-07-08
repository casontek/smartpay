
import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  final AppState appState;

  const SplashState({this.appState = AppState.loading});

  SplashState copyWith({
    AppState? appState
  }) {
    return SplashState(
      appState: appState ?? this.appState
    );
  }

  @override
  List<Object?> get props => [appState];

}

enum AppState {
  loading,
  notOnBoarded,
  onBoarded
}