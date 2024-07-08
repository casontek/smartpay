
import 'package:equatable/equatable.dart';

abstract class FillEvent extends Equatable {}

class NameChange extends FillEvent {
  final String name;

  NameChange(this.name);

  @override
  List<Object?> get props => [name];

}

class UsernameChange extends FillEvent {
  final String username;

  UsernameChange(this.username);

  @override
  List<Object?> get props => [username];

}

class PasswordChange extends FillEvent {
  final String password;

  PasswordChange(this.password);

  @override
  List<Object?> get props => [password];

}

class CountryChange extends FillEvent {
  final String country;
  final String code;

  CountryChange(this.country, this.code);

  @override
  List<Object?> get props => [country, code];

}

class UpdateProfile extends FillEvent {
  final String email;

  UpdateProfile(this.email);

  @override
  List<Object?> get props => [];

}