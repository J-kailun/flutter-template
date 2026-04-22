import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  final String? token;
  final String? name;
  final String? email;
  final String? avatar;
  final int? id;
  final String? phone;
  final String? address;
  final bool? isActive;
  final String? createdAt;
  final String? updatedAt;

  User({
    this.token,
    this.name,
    this.email,
    this.avatar,
    this.id,
    this.phone,
    this.address,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
