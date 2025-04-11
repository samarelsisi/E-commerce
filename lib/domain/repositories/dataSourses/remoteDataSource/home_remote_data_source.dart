import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/domain/entities/CategoryResponseEntity.dart';

abstract class HomeRemoteDataSource{
  Future<Either<Failures,CategoryOrBrandResponseEntity>>getAllCategory();
  Future<Either<Failures,CategoryOrBrandResponseEntity>>getAllBrands();

}