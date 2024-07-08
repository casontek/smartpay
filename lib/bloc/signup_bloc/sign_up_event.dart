
import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {}

class EmailChange extends SignUpEvent {
  final String email;

  EmailChange(this.email);

  @override
  List<Object?> get props => [email];

}

class EmailToken extends SignUpEvent {

  @override
  List<Object?> get props => [];

}