import 'dart:io';

import '../../../../data/repositories/auth_repository.dart';
import '../../../../data/usecases/register_usecase.dart';
import '../entities/user_entity.dart';
import '../payloads/register_param.dart';

class RegisterUseCaseImpl implements RegisterUseCase {
  
  final AuthRepository repository;

  RegisterUseCaseImpl({
    required this.repository
  });

  @override
  Future<UserEntity> execute({required String userName, required String userEmail, required String password, File? imageFile}) {
    
    var param = RegisterParam(
      userName: userName, 
      userEmail: userEmail, 
      password: password, 
      confirmPassword: password,
      imageFile: imageFile
    );

    return repository.register(param);
  }
  
  @override
  void cancel() => repository.cancel();
}