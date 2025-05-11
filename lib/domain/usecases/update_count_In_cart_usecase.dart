import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/entities/GetCartResponeEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/home/home_repository.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/cart/cart-repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class DeleteItemsInCartUseCase{
  CartRepository cartRepository;
  DeleteItemsInCartUseCase({required this. cartRepository
  });
 Future<Either<Failures,GetCartResponeEntity>> invoke(String productId){
    return cartRepository.deleteItemsInCart(productId);
  }
}