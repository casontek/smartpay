
import 'package:equatable/equatable.dart';
import 'package:smartpaymobile/models/user.dart';
import 'package:smartpaymobile/utils/app_status.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final Status status;
  final String token;
  final String message;
  final User? user;

  const LoginState({
    this.email = '',
    this.password = '',
    this.token = '',
    this.message = '',
    this.status = Status.initial,
    this.user
  });

  LoginState copyWith({
    String? email,
    String? password,
    String? token,
    String? message,
    Status? status,
    User? user
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status
    );
  }

  bool get isValidPassword => password.isNotEmpty;
  String? get isValidEmail => validateEmail();

  String? validateEmail() {
    if(email.isEmpty) {
      return 'email is required.';
    }

    return null;
  }

  @override
  List<Object?> get props => [email, password, status, user, token, message];

}