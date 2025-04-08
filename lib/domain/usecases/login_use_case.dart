import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/auth_repositories.dart';
import 'package:injectable/injectable.dart';
@injectable
class LoginUseCase{
  AuthRepositories authRepository;
  LoginUseCase({required this.authRepository});
  Future<Either <Failures,LoginResponseEntity>> invoke(String email,String password,){
    return authRepository.login(email,password);
  }
}