// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['full_name'] as String,
      json['username'] as String?,
      json['email'] as String,
      json['country'] as String,
      json['id'] as String,
      json['phone'] as String,
      json['phone_country'] as String,
      json['avatar'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'full_name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'country': instance.country,
      'phone_country': instance.phoneCountry,
      'id': instance.id,
      'avatar': instance.avatar,
    };
