import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/domain/entities/CategoryResponseEntity.dart';

abstract class HomeRepository{
  Future<Either<Failures,CategoryOrBrandResponseEntity>>getAllCategory();
  Future<Either<Failures,CategoryOrBrandResponseEntity>>getAllBrands();
}