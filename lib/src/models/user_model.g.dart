// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      name: json['fullname'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      id: json['id'] as String?,
      password: json['password'] as String?,
      token: json['token'] as String?,
      cpf: json['cpf'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'fullname': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'id': instance.id,
      'password': instance.password,
      'token': instance.token,
      'cpf': instance.cpf,
    };
