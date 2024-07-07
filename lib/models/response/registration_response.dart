
import 'package:json_annotation/json_annotation.dart';
import 'package:smartpaymobile/models/user.dart';

part 'registration_response.g.dart';

@JsonSerializable()
class RegistrationResponse {
  final User? user;
  final String? token;

  RegistrationResponse(this.user, this.token);

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) => _$RegistrationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationResponseToJson(this);

}