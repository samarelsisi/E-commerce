import 'dart:math';

import 'package:e_commerece_online_c13/domain/entities/GetCartResponeEntity.dart';
import 'package:e_commerece_online_c13/domain/usecases/get_cart_usecase.dart';
import 'package:e_commerece_online_c13/features/ui/pages/cart_screen/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class CartViewModel extends Cubit<CartStates>{
  CartViewModel({required this.getCartUseCase}):super(GetCartLoadingStates());
  GetCartUseCase getCartUseCase;
  List<GetProductsEntity> productsItemsList=[];
 void getItemInCart() async{
   emit(GetCartLoadingStates());
   var either=await getCartUseCase.invoke();
   return either.fold((error) {
     emit(GetCartErrorStates(errorMessage: error));},
       (response){
     productsItemsList=response.data!.products!;
     emit(GetCartSuccessState(responesEntity: response));
       });
 }
}