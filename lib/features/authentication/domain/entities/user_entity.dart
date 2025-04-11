
import 'dart:convert';

import '../../../../data/base_entity.dart';

class UserEntity extends BaseEntity {

  UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.image,
    required this.accessToken,
    required this.refreshToken
  });

  final int id;
  final String email;
  final String name;
  final String image;
  final String accessToken;
  final String refreshToken;
 
  @override
  Map<String, dynamic> toJson() => {
    'user_id': id,
    'user_email': email,
    'user_name': name,
    'user_image': image,
    'access': accessToken,
    'refresh': refreshToken
  };

  UserEntity copyWith({
    int? id,
    String? email,
    String? name,
    String? image,
    String? sessionId,
    String? accessToken,
    String? refreshToken
  }) => UserEntity(
    id: id ?? this.id,
    email: email ?? this.email,
    name: name ?? this.name,
    image:  image ?? this.image,
    accessToken: accessToken ?? this.accessToken,
    refreshToken: refreshToken ?? this.refreshToken
  );
  
  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
    id: json['user_id'],
    email: json['user_email'],
    name: json['user_name'],
    image: json['user_image'],
    accessToken: json['access'],
    refreshToken: json['refresh']
  );

  factory UserEntity.fromJsonString(String source) => UserEntity.fromJson(json.decode(source));
}