import '../../../../data/repositories/profile_repository.dart';
import '../../../../data/usecases/edit_profile_usecase.dart';

class EditProfileUseCaseImpl implements EditProfileUseCase {

  final ProfileRepository repository;

  EditProfileUseCaseImpl({
    required this.repository
  });
}