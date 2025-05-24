import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/domain/entities/CategoryResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetAllProductsUseCase{
  HomeRepository homeRepository;
  GetAllProductsUseCase({required this.homeRepository});
 Future<Either<Failures,ProductResponseEntity>> invoke(){
    return homeRepository.getAllProducts();
  }
}