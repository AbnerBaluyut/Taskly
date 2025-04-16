import 'app_exception.dart';

class TimeoutException extends AppException {
  TimeoutException() : super("Request timed out. Please try again.");
}