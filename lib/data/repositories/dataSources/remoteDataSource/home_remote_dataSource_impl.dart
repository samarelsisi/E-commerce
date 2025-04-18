import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/api/api_manager.dart';
import 'package:e_commerece_online_c13/core/api/end_points.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/data/models/CategoryResponseDM.dart';
import 'package:e_commerece_online_c13/data/models/ProductResponseDM.dart';
import 'package:e_commerece_online_c13/domain/entities/CategoryResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/dataSourses/remoteDataSource/home_remote_data_source.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:HomeRemoteDataSource )
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{
  ApiManager apiManager;
  HomeRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, CategoryOrBrandsResponseDm>> getAllCategory() async{
    var response=await  apiManager.getData(endPoint: EndPoints.getAllCategories);
    try{
      final List<ConnectivityResult> connectivityResult=await Connectivity().checkConnectivity();
      if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)){
        var getAllCategoriesResponse=CategoryOrBrandsResponseDm.fromJson(response.data);//convert response to object
        if(response.statusCode!>=200&&response.statusCode!<300){
          return Right(getAllCategoriesResponse);
        }
        else{
          return Left(ServerError(errorMsg: getAllCategoriesResponse.message!));
        }
      }
      else{
        // todo no internet connection
        return left(NetworkError(errorMsg: 'No Internet Connection ,Please Check Internet'));
      }
    }
    catch(e){
      return Left(Failures(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() async{
    var response=await  apiManager.getData(endPoint: EndPoints.getAllBrands);
    try{
      final List<ConnectivityResult> connectivityResult=await Connectivity().checkConnectivity();
      if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)){
        var getAllBrandsResponse=CategoryOrBrandsResponseDm.fromJson(response.data);//convert response to object
        if(response.statusCode!>=200&&response.statusCode!<300){
          return Right(getAllBrandsResponse);
        }
        else{
          return Left(ServerError(errorMsg: getAllBrandsResponse.message!));
        }
      }
      else{
        // todo no internet connection
        return left(NetworkError(errorMsg: 'No Internet Connection ,Please Check Internet'));
      }
    }
    catch(e){
      return Left(Failures(errorMsg: e.toString()));
    }
  }
  @override
  Future<Either<Failures, ProductResponseDm>> getAllProducts() async{
    var response=await  apiManager.getData(endPoint: EndPoints.getAllProducts);
    try{
      final List<ConnectivityResult> connectivityResult=await Connectivity().checkConnectivity();
      if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)){
        var getAllProductsResponse=ProductResponseDm.fromJson(response.data);//convert response to object
        if(response.statusCode!>=200&&response.statusCode!<300){
          return Right(getAllProductsResponse);
        }
        else{
          return Left(ServerError(errorMsg: getAllProductsResponse.message!));
        }
      }
      else{
        // todo no internet connection
        return left(NetworkError(errorMsg: 'No Internet Connection ,Please Check Internet'));
      }
    }
    catch(e){
      return Left(Failures(errorMsg: e.toString()));
    }
  }

}