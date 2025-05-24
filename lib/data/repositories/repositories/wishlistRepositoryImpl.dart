import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/domain/entities/AddItemToWishListResonseEntity.dart';
import 'package:e_commerece_online_c13/domain/entities/GetWishListResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/dataSourses/remoteDataSource/wishlist-remote-data-Source.dart';
import 'package:e_commerece_online_c13/domain/repositories/repositories/wisllist-repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WishListRepository)
class WishlistRepositoryimpl implements WishListRepository{
  WishListRemoteDataSource wishListRemoteDataSource;
  WishlistRepositoryimpl({required this.wishListRemoteDataSource});
  @override
  Future<Either<Failures, AddItemToWishListResponseEntity>> addItemToWishList(String productId
      ) async{
     var either=await wishListRemoteDataSource.AddItemToWishList(productId);
     return either.fold((error)=>Left(error), (response)=>Right(response));
  }

  @override
  Future<Either<Failures, GetWishListResponseEntity>> getItemsInWishList() async{
    var either=await wishListRemoteDataSource.getItemsInWishList();
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }}