import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/auth_repositories.dart';
class RegisterUseCase{
  AuthRepositories authRepository;
  RegisterUseCase({required this.authRepository});
 Future<Either <Failures,RegisterResponseEntity>> invoke(String name,String email,String password,
      String rePassword,String phone){
    return authRepository.register(name, email, password, rePassword, phone);
  }
}