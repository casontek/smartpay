
import 'package:equatable/equatable.dart';
import 'package:smartpaymobile/models/user.dart';

import '../../utils/app_status.dart';

class FillState extends Equatable {
  final String names;
  final String code;
  final String token;
  final String username;
  final String country;
  final String password;
  final String message;
  final Status status;
  final User? user;

  String? get isValidNames => validateNames();
  String? get isValidCountry => validateCountry();
  String? get isValidPassword => validatePassword();
  String? get isValidUsername => validateUsername();

  const FillState({
      this.names = '',
      this.code = '',
      this.username = '',
      this.country = '',
      this.password = '',
      this.message = '',
      this.user,
      this.token = '',
      this.status = Status.initial
  });

  FillState copyWith({
    String? names,
    String? code,
    User? user,
    String? token,
    String? username,
    String? country,
    String? password,
    String? message,
    Status? status
  }) {
    return FillState(
      names: names ?? this.names,
      code: code ?? this.code,
      user: user ?? this.user,
      token: token ?? this.token,
      username: username ?? this.username,
      country: country ?? this.country,
      password: password ?? this.password,
      message: message ?? this.message,
      status: status ?? this.status
    );
  }

  String? validateNames() {
    if(names.isEmpty) {
      return 'names is required.';
    }

    return null;
  }

  String? validateUsername() {
    if(username.isEmpty) {
      return 'username is required.';
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

  String? validateCountry() {
    if(country.isEmpty) {
      return 'Country is required.';
    }
    return null;
  }

  @override
  List<Object?> get props => [names, username, country, password, message, status, code, user, token];

}