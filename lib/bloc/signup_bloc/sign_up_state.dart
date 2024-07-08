
import 'package:equatable/equatable.dart';

import '../../utils/app_status.dart';

class SignUpState extends Equatable {
  final String email;
  final String token;
  final Status status;
  final String message;

  const SignUpState({
    this.email = '',
    this.token = '',
    this.status = Status.initial,
    this.message = ''
  });

  SignUpState copyWith({
    String? email,
    String? token,
    String? message,
    Status? status
  }) {
    return SignUpState(
        email: email ?? this.email,
        status: status ?? this.status,
        token: token ?? this.token,
        message: message ?? this.message
    );
  }

  String? get isValidEmail => validateEmail();

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

  @override
  List<Object?> get props => [email, message, status, token];

}