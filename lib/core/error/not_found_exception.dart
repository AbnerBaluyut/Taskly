import 'app_exception.dart';

class NotFoundException extends AppException {
  NotFoundException() : super("Not Found", code: 404);
}