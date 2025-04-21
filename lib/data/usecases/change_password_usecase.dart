import '../_bases/base_usecase.dart';

abstract class ChangePasswordUseCase extends BaseUseCase {

  Future<bool> execute( 
    {
      required String currentPassword, 
      required String newPassword
    }
  );
}