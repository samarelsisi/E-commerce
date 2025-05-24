import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/domain/entities/AddItemToWishListResonseEntity.dart';
import 'package:e_commerece_online_c13/domain/entities/GetWishListResponseEntity.dart';

abstract class WishListRemoteDataSource{
  Future<Either<Failures,AddItemToWishListResponseEntity>>AddItemToWishList(String productId);
  Future<Either<Failures,GetWishListResponseEntity>>getItemsInWishList();

}