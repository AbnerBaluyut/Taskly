import '../../../../data/remote_sources/profile_remote_source.dart';
import '../../../../data/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {

  final ProfileRemoteSource remoteSource;

  ProfileRepositoryImpl({
    required this.remoteSource
  });
  
}