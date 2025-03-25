import 'package:e_commerece_online_c13/domain/usecases/register_useCase.dart';
import 'package:e_commerece_online_c13/features/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class RegisterViewModel extends Cubit<RegisterStates>{
  RegisterUseCase registerUseCase;
  RegisterViewModel({required this.registerUseCase}):super(RegisterInitState());
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  var formKey=GlobalKey<FormState>();
  void register()async{
    if(formKey.currentState?.validate()==true){
      emit(RegisterLoadingState());
      var either=await registerUseCase.invoke(fullNameController.text, mailController.text,
          passwordController.text,rePasswordController.text,phoneController.text);
      either.fold((error){
        emit(RegisterErrorState(errorMessage: error));
      }, (response){
        emit(RegisterSuccessState(responseEntity: response));
      });
    }
    }

}