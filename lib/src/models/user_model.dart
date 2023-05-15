// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'fullname')
  String? name;
  String? email;
  String? phone;
  String? id;
  String? password;
  String? token;
  String? cpf;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.id,
    this.password,
    this.token,
    this.cpf,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
