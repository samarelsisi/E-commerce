import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/data/models/RegisterResponseDM.dart';
import 'package:e_commerece_online_c13/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/entities/RegisterResponseEntity.dart';

abstract class LoginStates{}
class LoginInitState extends LoginStates
{}
class  LoginLoadingState extends LoginStates
{

}
class LoginErrorState extends LoginStates{
Failures errorMessage;
LoginErrorState({required this.errorMessage});
}
class LoginSuccessState extends LoginStates{
LoginResponseEntity responseEntity;
LoginSuccessState({required this.responseEntity});
}
