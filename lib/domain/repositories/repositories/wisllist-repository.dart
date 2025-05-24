import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/domain/entities/AddItemToWishListResonseEntity.dart';
import 'package:e_commerece_online_c13/domain/entities/GetWishListResponseEntity.dart';

abstract class WishListRepository{
  Future<Either<Failures,AddItemToWishListResponseEntity>>addItemToWishList(String productId);
  Future<Either<Failures,GetWishListResponseEntity>>getItemsInWishList();

}