import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  
  String format({String? pattern = 'yyyy-MM-dd'}) {
    return DateFormat(pattern).format(this);
  }

  /// Common pre-defined formats
  String get toYMD => DateFormat('yyyy-MM-dd').format(this);
  String get toDMY => DateFormat('dd/MM/yyyy').format(this);
  String get toReadable => DateFormat('MMM dd, yyyy').format(this);
  String get toFullDate => DateFormat('EEEE, MMMM d, yyyy').format(this);
  String get toTime12h => DateFormat('hh:mm a').format(this);
  String get toTime24h => DateFormat('HH:mm').format(this);

  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year && month == yesterday.month && day == yesterday.day;
  }

  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year && month == tomorrow.month && day == tomorrow.day;
  }

  bool get isPast => isBefore(DateTime.now());
  bool get isFuture => isAfter(DateTime.now());

  DateTime addDays(int days) => add(Duration(days: days));
  DateTime subtractDays(int days) => subtract(Duration(days: days));

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}