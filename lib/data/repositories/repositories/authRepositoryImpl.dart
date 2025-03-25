import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/dataSourses/remoteDataSource/auth_remote_data_Source.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/auth_repositories.dart';
import 'package:injectable/injectable.dart';
 @Injectable(as: AuthRepositories)
 class AuthRepositoryImpl implements AuthRepositories {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name, String email, String password, String rePassword, String phone)async {
   var either=await authRemoteDataSource.register(name, email, password, rePassword, phone);
   return either.fold((error)=>Left(error), (response)=>Right(response));
  }

}