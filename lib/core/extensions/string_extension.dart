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
    if (Platform.isAndroid && (startsWith('/storage/') || startsWith('/data/'))) {
      return true;
    }

    // iOS file path
    if (Platform.isIOS && (startsWith('/var/') || startsWith('/private/var/'))) {
      return true;
    }

    return startsWith('file://');
  }

  bool get isBase64Image {
    return startsWith('data:image');
  }

  ImageSourceType get imageSourceType {
    if (isHttpUrl) return ImageSourceType.network;
    if (isBase64Image) return ImageSourceType.base64;
    if (isLocalFilePath) return ImageSourceType.file;
    return ImageSourceType.unknown;
  }
}