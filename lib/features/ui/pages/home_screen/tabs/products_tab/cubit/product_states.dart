import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/entities/ProductResponseEntity.dart';

abstract class ProductStates{
}
class ProductInitState extends ProductStates{
}
class ProductErrorState extends ProductStates{
Failures errorMessage;
ProductErrorState({required this.errorMessage});
}
class ProductLoadingState extends ProductStates{

}
class ProductSuccessState extends ProductStates{
ProductResponseEntity responseEntity;
ProductSuccessState({required this.responseEntity});
}

class AddToCartErrorState extends ProductStates{
  Failures errorMessage;
  AddToCartErrorState({required this.errorMessage});
}
class AddToCartLoadingState extends ProductStates{

}
class AddToCartSuccessState extends ProductStates{
  AddToCartResponseEntity responseEntity;
  AddToCartSuccessState({required this.responseEntity});
}