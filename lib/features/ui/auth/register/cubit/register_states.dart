import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/data/models/RegisterResponseDM.dart';
import 'package:e_commerece_online_c13/domain/entities/RegisterResponseEntity.dart';

abstract class RegisterStates{}
class RegisterInitState extends RegisterStates
{}
class  RegisterLoadingState extends RegisterStates
{

}
class RegisterErrorState extends RegisterStates{
Failures errorMessage;
 RegisterErrorState({required this.errorMessage});
}
class RegisterSuccessState extends RegisterStates{
RegisterResponseEntity responseEntity;
RegisterSuccessState({required this.responseEntity});
}
