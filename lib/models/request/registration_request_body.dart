
import 'package:json_annotation/json_annotation.dart';

part 'registration_request_body.g.dart';

@JsonSerializable()
class RegistrationRequestBody {
  @JsonKey(name: 'full_name')
  final String name;
  final String? username;
  final String email;
  final String country;
  final String password;
  @JsonKey(name: 'device_name')
  final String device;

  RegistrationRequestBody(
      this.name,
      this.username,
      this.email,
      this.country,
      this.password,
      this.device
      );

  factory RegistrationRequestBody.fromJson(Map<String, dynamic> json) => _$RegistrationRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationRequestBodyToJson(this);

}