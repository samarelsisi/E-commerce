import 'package:e_commerece_online_c13/domain/entities/ProductResponseEntity.dart';

import 'package:e_commerece_online_c13/domain/usecases/get_all_products_usecase.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/products_tab/cubit/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductViewModel extends Cubit<ProductStates> {
  GetAllProductsUseCase getAllProductsUseCase;
  // AddCartUseCase addCartUseCase;

  ProductViewModel(
      {required this.getAllProductsUseCase, })
      :super(ProductInitState());

  //todo: hold data - handle logic
  List<ProductEntity> productsList = [];
  int numOfCartItem = 0;

  static ProductViewModel get(context) => BlocProvider.of(context);

  void getAllProducts() async {
    emit(ProductLoadingState());
    var either = await getAllProductsUseCase.invoke();
    either.fold((error) {
      emit(ProductErrorState(errorMessage: error));
    }, (response) {
      productsList = response.data!;
      emit(ProductSuccessState(responseEntity: response));
    });
  }

  // void addToCart(String productId) async {
  //   emit(AddCartLoadingState());
  //   var either = await addCartUseCase.invoke(productId);
  //   either.fold((error) {
  //     emit(AddCartErrorState(failures: error));
  //   }, (response) {
  //     numOfCartItem = response.numOfCartItems!.toInt();
  //     print('numOfCartItem: $numOfCartItem');
  //     emit(AddCartSuccessState(responseEntity: response));
  //   });
  // }
}

