// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_verification_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailVerificationBody _$EmailVerificationBodyFromJson(
        Map<String, dynamic> json) =>
    EmailVerificationBody(
      json['email'] as String,
      json['token'] as String,
    );

Map<String, dynamic> _$EmailVerificationBodyToJson(
        EmailVerificationBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'token': instance.token,
    };
