import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/domain/entities/AddItemToWishListResonseEntity.dart';
import 'package:e_commerece_online_c13/domain/entities/GetWishListResponseEntity.dart';

abstract class Wishliststates {
}
class WishListSuccessStates extends Wishliststates{
AddItemToWishListResponseEntity responseEntity;
WishListSuccessStates({required this.responseEntity,});
}
class WishListErrorState extends Wishliststates{
Failures errorMessage;
WishListErrorState ({required this.errorMessage});
}
class WishListLoadingState extends Wishliststates{

}
class GetWishListSuccessStates extends Wishliststates{
  GetWishListResponseEntity responseEntity;
  GetWishListSuccessStates({required this.responseEntity});
}