import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/domain/entities/AddItemToWishListResonseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/wisllist-repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddItemsInWishListUseCase{
  WishListRepository wishListRepository;
  AddItemsInWishListUseCase({required this. wishListRepository
  });
  Future<Either<Failures, AddItemToWishListResponseEntity>> invoke(String productId){
    return wishListRepository.addItemToWishList(productId);
  }
}