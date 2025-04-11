import 'dart:io';

import 'package:intl/intl.dart';

import '../enums/image_source_type.dart';

extension StringExtension on String {


  bool isEmailValid() {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(this);
  }

  DateTime toDate(String pattern) {
    return DateFormat(pattern).parse(this);
  }

  bool get isHttpUrl {
    final uri = Uri.tryParse(this);
    return uri != null && (uri.isScheme('http') || uri.isScheme('https'));
  }

  bool get isLocalFilePath {
    final lower = toLowerCase();
    final isAndroid = Platform.isAndroid && (lower.startsWith('/storage/') || lower.startsWith('/data/') ||  lower.contains("/storage/emulated/"));
    final isiOS = Platform.isIOS && (lower.startsWith('/var/') || lower.startsWith('/private/var/') ||  lower.contains("/users/") && lower.contains("/library/developer/coresimulator/devices/"));
    return isiOS || isAndroid || startsWith('file://');
  }

  bool get isBase64Image {
    return startsWith('data:image');
  }


  bool get isAssetPath => startsWith('assets/');

  ImageSourceType get imageSourceType {
    if (isHttpUrl) {
      return ImageSourceType.network;
    }  else if (isLocalFilePath) {
      return ImageSourceType.file;
    } else if (isAssetPath)  {
      return ImageSourceType.assset;
    } else {
      return ImageSourceType.unknown;
    }
  }

  String? get validatePassword {
    var value = this;
    if (value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }

    return null; // valid
  }

}