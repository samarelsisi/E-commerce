import 'package:bloc/bloc.dart';
import 'package:e_commerece_online_c13/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/usecases/add_item_inWishList_usecase.dart';
import 'package:e_commerece_online_c13/domain/usecases/get_Items_wishList_usecase.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/favorite_tab/cubit/wishListStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class Wishlistviewmodel extends Cubit<Wishliststates>{
  AddItemsInWishListUseCase addItemsInWishListUseCase;
  GetWishListUseCase getWishListUseCase;
  Wishlistviewmodel({required this.addItemsInWishListUseCase,required this.getWishListUseCase}):super(WishListLoadingState());
  static Wishlistviewmodel get(context) => BlocProvider.of(context);
  List<ProductEntity> wishListItemsList=[];

  void addToWishList(String productId) async {
    emit(WishListLoadingState());
    var either = await addItemsInWishListUseCase.invoke(productId);
    either.fold((error) {
      print(error);
      emit(WishListErrorState(errorMessage: error));
    },(response){

      print("added success");
      emit(WishListSuccessStates(responseEntity: response));
    });
  }
  void getWishListItems() async{
    emit(WishListLoadingState());
    var either=await getWishListUseCase.invoke();
    return either.fold((error) {
      emit(WishListErrorState(errorMessage: error));},
            (response){
          wishListItemsList=response.data!;

          emit(GetWishListSuccessStates( responseEntity: response));
        });
  }
}