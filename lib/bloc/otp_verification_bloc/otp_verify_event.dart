
import 'package:equatable/equatable.dart';

abstract class OtpVerifyEvent extends Equatable {}

class KeySelection extends OtpVerifyEvent {
  final String keyCode;
  final bool isLogin;

  KeySelection(this.keyCode, {this.isLogin = false});

  @override
  List<Object?> get props => [keyCode, isLogin];

}

class StatusReset extends OtpVerifyEvent {

  @override
  List<Object?> get props => [];

}

class BoxSelection extends OtpVerifyEvent {
  final int boxNumber;

  BoxSelection(this.boxNumber);

  @override
  List<Object?> get props => [boxNumber];

}

class KeyDeletion extends OtpVerifyEvent {

  @override
  List<Object?> get props => [];

}

class CodeVerification extends OtpVerifyEvent {
  final String email;

  CodeVerification(this.email);

  @override
  List<Object?> get props => [email];
}

class CreatePin extends OtpVerifyEvent {

  @override
  List<Object?> get props => [];

}

class PinLogin extends OtpVerifyEvent {

  @override
  List<Object?> get props => [];
}