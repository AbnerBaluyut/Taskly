import 'app_exception.dart';

class UnauthorizedException extends AppException {
  UnauthorizedException(super.message, {super.code});
}