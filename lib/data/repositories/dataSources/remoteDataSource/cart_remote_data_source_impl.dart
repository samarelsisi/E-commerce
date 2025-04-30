 import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
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

  Future<Either<Failures, GetCartResponeEntity>> getItemsInCart() async{
    var token=SharedPrefernceUtlis.getData(key: "token");

    var response=await  apiManager.getData(endPoint: EndPoints.addToCart,

    headers: {
      'token':token
    });
    try{
      final List<ConnectivityResult> connectivityResult=await Connectivity().checkConnectivity();
      if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)){
        var getCartItems=GetCartResponseDm.fromJson(response.data);//convert response to object
        if(response.statusCode!>=200&&response.statusCode!<300){
          return Right(getCartItems);
        }
        else{
          return Left(ServerError(errorMsg: getCartItems.message!));
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