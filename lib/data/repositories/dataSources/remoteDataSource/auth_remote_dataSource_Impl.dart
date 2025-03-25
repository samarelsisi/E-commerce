import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/api/api_manager.dart';
import 'package:e_commerece_online_c13/core/api/end_points.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/data/models/RegisterResponseDM.dart';
import 'package:e_commerece_online_c13/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/dataSourses/remoteDataSource/auth_remote_data_Source.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name, String email, String password, String rePassword, String phone)async {
  var response=await  apiManager.postData(endPoint: EndPoints.signUp,body: {
     "name": name,
     "email":email,
     "password":password,
     "rePassword":rePassword,
     "phone":phone
   });
  try{
    final List<ConnectivityResult> connectivityResult=await Connectivity().checkConnectivity();
    if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)){
      var registerResponse=RegisterResponseDm.fromJson(response.data);//convert response to object
      if(response.statusCode!>=200&&response.statusCode!<300){
        return Right(registerResponse);
      }
      else{
        return Left(ServerError(errorMsg: registerResponse.message!));
      }
    }
    else{
      // todo no internet connection
      return left(NetworkError(errorMsg: 'No Internet Connection ,Please Check Internet'));
    }
  }
 catch(e){
    return Left(ServerError(errorMsg: e.toString()));
 }
  }
  
}