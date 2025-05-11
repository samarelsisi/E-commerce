import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/domain/entities/GetCartResponeEntity.dart';

import '../../../../../domain/entities/GetCartResponeEntity.dart';

abstract class CartStates{}
class GetCartInitState extends CartStates{

}
class GetCartSuccessState extends CartStates{
GetCartResponeEntity responesEntity;
GetCartSuccessState({required this.responesEntity});
}
class GetCartLoadingStates extends CartStates{

}
class GetCartErrorStates extends CartStates{
 Failures errorMessage;
 GetCartErrorStates({required this.errorMessage});
}
class DeleteItemLoadingStates extends CartStates{

}
class DeleteItemErrorStates extends CartStates{
 Failures errorMessage;
 DeleteItemErrorStates({required this.errorMessage});
}
class DeleteItemSuccessStates extends CartStates{
 GetCartResponeEntity responesEntity;
 DeleteItemSuccessStates({required this.responesEntity});
}