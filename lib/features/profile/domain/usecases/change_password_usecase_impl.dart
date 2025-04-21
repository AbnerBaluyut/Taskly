import '../../../../data/repositories/profile_repository.dart';
import '../../../../data/usecases/change_password_usecase.dart';
import '../payloads/change_password_param.dart';

class ChangePasswordUseCaseImpl implements ChangePasswordUseCase {

  final ProfileRepository repository;

  ChangePasswordUseCaseImpl({
    required this.repository
  });

  @override
  Future<bool> execute({required String currentPassword, required String newPassword}) {
    var param = ChangePasswordParam(
      currentPassword: currentPassword,
      newPassword: newPassword
    );
    return repository.changePassword(param);
  }
  
  @override
  void cancel() => repository.cancel();
}