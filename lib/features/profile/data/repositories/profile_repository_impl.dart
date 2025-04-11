
import 'package:dio/dio.dart';
import 'package:taskly/features/authentication/data/models/user/user_model.dart';
import 'package:taskly/features/profile/domain/payloads/change_password_param.dart';

import '../../../../data/remote_sources/profile_remote_source.dart';
import '../../../../data/repositories/profile_repository.dart';
import '../../../authentication/domain/entities/user_entity.dart';
import '../../domain/payloads/edit_profile_param.dart';

class ProfileRepositoryImpl implements ProfileRepository {

  final ProfileRemoteSource remoteSource;

  ProfileRepositoryImpl({
    required this.remoteSource
  });

  @override
  Future<UserEntity> editProfile(EditProfileParam param, CancelToken? cancelToken) async {
    
    final model = await remoteSource.editProfile(param.toFormData(), cancelToken);
    return model.data.toEntity();
  }

  @override
  Future<bool> changePassword(ChangePasswordParam param, CancelToken? cancelToken) => remoteSource.changePassword(param.toFormData(), cancelToken);
}