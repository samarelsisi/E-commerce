import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/domain/entities/GetCartResponeEntity.dart';
import 'package:injectable/injectable.dart';

abstract class CartRepository{
  Future<Either<Failures,GetCartResponeEntity>>getItemsInCart();
  Future<Either<Failures,GetCartResponeEntity>>deleteItemsInCart(String productId);
  Future<Either<Failures,GetCartResponeEntity>>updateCountInCart(String productId,String count);

}