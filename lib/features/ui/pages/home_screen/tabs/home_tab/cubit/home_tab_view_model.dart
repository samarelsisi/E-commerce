import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/domain/entities/CategoryResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/usecases/get_all_brands_usecase.dart';
import 'package:e_commerece_online_c13/domain/usecases/get_all_category_usecase.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoryUseCase getAllCategoryUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;
  HomeTabViewModel({required this.getAllCategoryUseCase,required this.getAllBrandsUseCase})
      :super(HomeTabInitState());
List<CategoryOrBrandEntity>categoryList=[];
List<CategoryOrBrandEntity>brandsList=[];
 void getAllCategories() async{
    emit(CategoryLoadingState());
    var either=await getAllCategoryUseCase.invoke();
     either.fold((error){
      emit(CategoryErrorState(errorMessage: error));
    }, (response){
       categoryList=response.data!;
      emit(CategorySuccessState(responseEntity: response));
    });
  }
  void getAllBrands() async{
    emit(BrandsLoadingState());
    var either=await getAllBrandsUseCase.invoke();
    either.fold((error){
      emit(BrandsErrorState(errorMessage: error));
    }, (response){
      brandsList=response.data!;
      emit(BrandsSuccessState(responseEntity: response));
    });
  }
}