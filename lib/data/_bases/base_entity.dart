import 'dart:convert';

import 'package:equatable/equatable.dart';

abstract class BaseEntity extends Equatable {

  // Converts the Entity to a JSON Map
  Map<String, dynamic> toJson();

  // Convers the JSON Map to a JSON String
  String toJsonString() => json.encode(toJson());
}