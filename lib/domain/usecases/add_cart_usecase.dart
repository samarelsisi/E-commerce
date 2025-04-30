import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class AddCartUseCase{
  HomeRepository homeRepository;
  AddCartUseCase({required this.homeRepository});
 Future<Either<Failures,AddToCartResponseEntity>> invoke(String productId){
    return homeRepository.addToCart(productId);
  }
}