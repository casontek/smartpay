
import 'package:equatable/equatable.dart';
import 'package:smartpaymobile/utils/app_status.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final Status status;
  final String message;

  const LoginState({
    this.email = '',
    this.password = '',
    this.status = Status.initial,
    this.message = ''
  });

  String? get isValidEmail => validateEmail();
  String? get isValidPassword => validatePassword();

  String? validateEmail() {
    if(email.isEmpty) {
      return 'email address is required.';
    }
    else {
      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

      if (!emailRegex.hasMatch(email)) {
        return 'Please enter a valid email';
      }
    }

    return null;
  }

  String? validatePassword() {
    if(password.isEmpty) {
      return 'password is required.';
    }
    else {
      final passwordRegExp = RegExp(r'^(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{6,}$',);
      return passwordRegExp.hasMatch(password) ? null : 'Invalid password.';
    }
  }

  @override
  List<Object?> get props => [status, message, password, email];

}