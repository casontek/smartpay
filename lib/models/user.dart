
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'full_name')
  final String name;
  final String? username;
  final String email;
  final String phone;
  final String country;
  @JsonKey(name: 'phone_country')
  final String phoneCountry;
  final String id;
  final String avatar;

  User(
      this.name,
      this.username,
      this.email,
      this.country,
      this.id,
      this.phone,
      this.phoneCountry,
      this.avatar
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}