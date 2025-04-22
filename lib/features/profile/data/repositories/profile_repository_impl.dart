
import 'package:fpdart/fpdart.dart';
import 'package:taskly/features/authentication/data/models/user/user_model.dart';

import '../../../../data/remote_sources/profile_remote_source.dart';
import '../../../../data/repositories/profile_repository.dart';
import '../../../authentication/domain/entities/user_entity.dart';
import '../../domain/payloads/change_password_param.dart';
import '../../domain/payloads/edit_profile_param.dart';

class ProfileRepositoryImpl implements ProfileRepository {

  final ProfileRemoteSource remoteSource;

  ProfileRepositoryImpl({
    required this.remoteSource
  });

  @override
  TaskEither<String, UserEntity> editProfile(EditProfileParam param) {
    final result = remoteSource.editProfile(param.toFormData()).map((model) => model.data.toEntity());
    return result;
  }

  @override
  TaskEither<String, bool> changePassword(ChangePasswordParam param) => remoteSource.changePassword(param.toFormData());
  
  @override
  void cancel() => remoteSource.cancel();
}