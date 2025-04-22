import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../data/repositories/profile_repository.dart';
import '../../../../data/usecases/edit_profile_usecase.dart';
import '../../../authentication/domain/entities/user_entity.dart';
import '../payloads/edit_profile_param.dart';

class EditProfileUseCaseImpl implements EditProfileUseCase {

  final ProfileRepository repository;

  EditProfileUseCaseImpl({
    required this.repository
  });

  @override
  TaskEither<String, UserEntity> execute({required String name, File? file}) {
    var param = EditProfileParam(
      name: name,
      imageFile: file
    );
    return repository.editProfile(param);
  }
  
  @override
  void cancel() => repository.cancel();
}