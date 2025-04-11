import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/domain/entities/CategoryResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetAllBrandsUseCase{
  HomeRepository homeRepository;
  GetAllBrandsUseCase({required this.homeRepository});
 Future<Either<Failures,CategoryOrBrandResponseEntity>> invoke(){
    return homeRepository.getAllBrands();
  }
}