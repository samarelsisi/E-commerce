import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/domain/entities/CategoryResponseEntity.dart';

abstract class HomeTabStates{}
class HomeTabInitState extends HomeTabStates{}
class  CategoryLoadingState extends HomeTabStates
{

}
class CategoryErrorState extends HomeTabStates{
  Failures errorMessage;
  CategoryErrorState({required this.errorMessage});
}
class CategorySuccessState extends HomeTabStates{
  CategoryOrBrandResponseEntity responseEntity;
  CategorySuccessState({required this.responseEntity});}
class  BrandsLoadingState extends HomeTabStates
{

}
class BrandsErrorState extends HomeTabStates{
  Failures errorMessage;
  BrandsErrorState({required this.errorMessage});
}
class BrandsSuccessState extends HomeTabStates{
  CategoryOrBrandResponseEntity responseEntity;
  BrandsSuccessState({required this.responseEntity});}