// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationRequestBody _$RegistrationRequestBodyFromJson(
        Map<String, dynamic> json) =>
    RegistrationRequestBody(
      json['full_name'] as String,
      json['username'] as String?,
      json['email'] as String,
      json['country'] as String,
      json['password'] as String,
      json['device_name'] as String,
    );

Map<String, dynamic> _$RegistrationRequestBodyToJson(
        RegistrationRequestBody instance) =>
    <String, dynamic>{
      'full_name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'country': instance.country,
      'password': instance.password,
      'device_name': instance.device,
    };
