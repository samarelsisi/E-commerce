import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/domain/entities/CategoryResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/dataSourses/remoteDataSource/home_remote_data_source.dart';
import 'package:e_commerece_online_c13/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository{
  HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl({required this.homeRemoteDataSource});
  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategory() async{
 var either=await homeRemoteDataSource.getAllCategory();
 return either.fold((error)=>Left(error), (response)=>Right(response));
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() async{
    var either=await homeRemoteDataSource.getAllBrands();
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() async {
    var either = await homeRemoteDataSource.getAllProducts();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

}