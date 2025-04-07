import 'package:intl/intl.dart';

extension StringExtension on String {


  bool isEmailValid() {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(this);
  }

  DateTime toDate(String pattern) {
    return DateFormat(pattern).parse(this);
  }
}