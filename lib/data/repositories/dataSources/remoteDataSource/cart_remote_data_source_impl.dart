 import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/api/api_constant.dart';
import 'package:e_commerece_online_c13/core/api/api_manager.dart';
import 'package:e_commerece_online_c13/core/api/end_points.dart';
import 'package:e_commerece_online_c13/core/cached/cache_helper.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/data/models/GetCartResponseDM.dart';
import 'package:e_commerece_online_c13/domain/entities/GetCartResponeEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/dataSourses/remoteDataSource/cart_remote_data_Source.dart';
import 'package:injectable/injectable.dart';
@Injectable( as:CartRemoteDataSource )
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  @override
  ApiManager apiManager;
  CartRemoteDataSourceImpl({required this.apiManager});
  var token=SharedPrefernceUtlis.getData(key: "token");

  Object? get respnse => null;

  Future<Either<Failures, GetCartResponeEntity>> getItemsInCart() async{
    var response=await apiManager.getData(endPoint: EndPoints.addToCart,
    headers: {
      'token':token
    });
    print(response);
    try{
      final List<ConnectivityResult> connectivityResult=await Connectivity().checkConnectivity();
      if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)){
        var deleteItemsInCart=GetCartResponseDm.fromJson(response.data);//convert response to object
        if(response.statusCode!>=200&&response.statusCode!<300){
          return Right(deleteItemsInCart);
        }
        else{
          return Left(ServerError(errorMsg: deleteItemsInCart.message!));
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
  Future<Either<Failures, GetCartResponseDm>> deleteItemsInCart(
      String productId) async {
    try {
      final List<ConnectivityResult> connectivityResult =
      await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var token = SharedPrefernceUtlis.getData(key: 'token');
        var response = await apiManager.deleteData(
            endPoint: '${EndPoints.addToCart}/$productId',
            headers: {'token': token});
        var getCartResponse = GetCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getCartResponse);
        } else {
          return Left(ServerError(errorMsg: getCartResponse.message!));
        }
      } else {
        //todo : no internet connection
        return Left(NetworkError(
            errorMsg: 'No Internet Connection, Please Check Internet.'));
      }
    } catch (e) {
      return Left(Failures(errorMsg: e.toString()));
    }}

  @override
  Future<Either<Failures, GetCartResponseDm>> updateCountInCart(String productId, int count) async{
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var token = SharedPrefernceUtlis.getData(key: 'token');
        var response = await apiManager.updateData(
            endPoint: '${EndPoints.addToCart}/$productId',
            body: {
              "count":"$count"
            },
            headers: {'token': token});
        var getCartResponse = GetCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getCartResponse);
        } else {
          return Left(ServerError(errorMsg: getCartResponse.message!));
        }
      } else {
        //todo : no internet connection
        return Left(NetworkError(
            errorMsg: 'No Internet Connection, Please Check Internet.'));
      }
    } catch (e) {
      return Left(Failures(errorMsg: e.toString()));
    }
  }

}