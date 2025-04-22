import 'package:fpdart/fpdart.dart';

import '../_bases/base_usecase.dart';

abstract class ChangePasswordUseCase extends BaseUseCase {

  TaskEither<String, bool> execute( 
    {
      required String currentPassword, 
      required String newPassword
    }
  );
}