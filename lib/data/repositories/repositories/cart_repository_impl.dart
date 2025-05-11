import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/domain/entities/GetCartResponeEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/dataSourses/remoteDataSource/cart_remote_data_Source.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/cart/cart-repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:CartRepository )
class CartRepositoryImpl implements CartRepository{
  CartRemoteDataSource cartRemoteDataSource;
  CartRepositoryImpl({required this.cartRemoteDataSource});
  @override

  Future<Either<Failures, GetCartResponeEntity>> getItemsInCart() async{
    var either=await cartRemoteDataSource.getItemsInCart();
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }

  @override
  Future<Either<Failures, GetCartResponeEntity>> deleteItemsInCart(String productId) async{
    var either=await cartRemoteDataSource.deleteItemsInCart(productId);
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }

  @override
  Future<Either<Failures, GetCartResponeEntity>> updateCountInCart(String productId, String count) {
    // TODO: implement updateCountInCart
    throw UnimplementedError();
  }

}