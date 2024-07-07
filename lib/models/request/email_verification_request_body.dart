
import 'package:json_annotation/json_annotation.dart';

part 'email_verification_request_body.g.dart';

@JsonSerializable()
class EmailVerificationBody {
  final String email;
  final String token;

  EmailVerificationBody(this.email, this.token);

  factory EmailVerificationBody.fromJson(Map<String, dynamic> json) => _$EmailVerificationBodyFromJson(json);

  Map<String, dynamic> toJson() => _$EmailVerificationBodyToJson(this);

}