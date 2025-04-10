
import 'dart:convert';

import '../../../../data/base_entity.dart';

class UserEntity extends BaseEntity {

  UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.image,
    required this.sessionId,
  });

  final int id;
  final String email;
  final String name;
  final String image;
  final String sessionId;
 
  @override
  Map<String, dynamic> toJson() => {
    'user_id': id,
    'user_email': email,
    'user_name': name,
    'user_image': image,
    'session_id': sessionId,
  };

  UserEntity copyWith({
    int? id,
    String? email,
    String? name,
    String? image,
    String? sessionId
  }) => UserEntity(
    id: id ?? this.id,
    email: email ?? this.email,
    name: name ?? this.name,
    image:  image ?? this.image,
    sessionId:  sessionId ?? this.sessionId
  );
  
  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
    id: json['user_id'],
    email: json['user_email'],
    name: json['user_name'],
    image: json['user_image'],
    sessionId: json['user_image'],
  );

  factory UserEntity.fromJsonString(String source) => UserEntity.fromJson(json.decode(source));
}