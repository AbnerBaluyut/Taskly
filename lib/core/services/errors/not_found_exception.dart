import '../../styles/strings.dart';
import 'app_exception.dart';

class NotFoundException extends AppException {
  NotFoundException() : super(Strings.errorMessage, code: 404);
}