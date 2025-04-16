import 'package:flutter/material.dart';

import '../../../../core/enums/social_enum.dart';

class SocialModel {

  final IconData icon;
  final SocialEnum social;
  final Color? backgroundColor;
  final Color? iconColor;

  SocialModel({required this.icon, required this.social, required this.backgroundColor, required this.iconColor});
}