import 'package:e_commerece_online_c13/domain/usecases/login_use_case.dart';
import 'package:e_commerece_online_c13/domain/usecases/register_useCase.dart';
import 'package:e_commerece_online_c13/features/ui/auth/login/cubit/login_states.dart';
import 'package:e_commerece_online_c13/features/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class LoginViewModel extends Cubit<LoginStates>{
  LoginUseCase loginUseCase;
  LoginViewModel({required this.loginUseCase}):super(LoginInitState());
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey=GlobalKey<FormState>();
  void login()async{
    if(formKey.currentState?.validate()==true){
      emit(LoginLoadingState());
      var either=await loginUseCase.invoke(mailController.text,
          passwordController.text);
      either.fold((error){
        emit(LoginErrorState(errorMessage: error));
      }, (response){
        emit(LoginSuccessState(responseEntity: response));
      });
    }
    }

}