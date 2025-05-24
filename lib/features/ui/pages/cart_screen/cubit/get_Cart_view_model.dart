import 'dart:math';

import 'package:e_commerece_online_c13/domain/entities/GetCartResponeEntity.dart';
import 'package:e_commerece_online_c13/domain/usecases/delete_items_In_cart_usecase.dart';
import 'package:e_commerece_online_c13/domain/usecases/get_cart_usecase.dart';
import 'package:e_commerece_online_c13/domain/usecases/update_count_In_cart_usecase.dart';
import 'package:e_commerece_online_c13/features/ui/pages/cart_screen/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class CartViewModel extends Cubit<CartStates>{
  CartViewModel({required this.getCartUseCase ,required this.deleteItemsInCartUseCase,required this.updateCountInCartUseCase}):super(GetCartLoadingStates());
  GetCartUseCase getCartUseCase;
  DeleteItemsInCartUseCase deleteItemsInCartUseCase;
  UpdateCountInCartUseCase updateCountInCartUseCase;
  List<GetProductsEntity> productsItemsList=[];
  static CartViewModel get(context)=>BlocProvider.of(context);
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
  void deleteItemsInCart(String productId) async{
    // emit(DeleteItemLoadingStates());
    var either=await deleteItemsInCartUseCase.invoke(productId);
    return either.fold((error) {
      emit(DeleteItemErrorStates(errorMessage: error));
      print(error);
      },
            (response){
              productsItemsList = response.data!.products!;
          emit(GetCartSuccessState(responesEntity: response));
        });
  }
  void updateCountInCart(String productId, int count) async {
    // emit(DeleteItemsInCartLoadingState());
    var either = await updateCountInCartUseCase.invoke(productId, count);
    either.fold((error) {
      emit(UpdateCountInCartErrorState(failures: error));
    }, (response) {
      // productsItemsList = response.data!.products!;
      print('updated successfully');
      emit(GetCartSuccessState(responesEntity: response));
    });
  }

}