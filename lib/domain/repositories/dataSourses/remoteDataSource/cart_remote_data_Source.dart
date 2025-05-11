import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/domain/entities/GetCartResponeEntity.dart';

abstract class CartRemoteDataSource{
  Future<Either<Failures,GetCartResponeEntity>>getItemsInCart();
  Future<Either<Failures,GetCartResponeEntity>>deleteItemsInCart(String productId);
  Future<Either<Failures,GetCartResponeEntity>>updateCountInCart(String productId,String count);

}