import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/domain/entities/RegisterResponseEntity.dart';

import '../../../core/errors/failures.dart';

abstract class AuthRepositories {
 Future<Either<Failures,RegisterResponseEntity>> register(String name, String email, String password, String rePassword,
      String phone);
}
