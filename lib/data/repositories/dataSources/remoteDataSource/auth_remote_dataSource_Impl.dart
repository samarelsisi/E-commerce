import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/api/api_manager.dart';
import 'package:e_commerece_online_c13/core/api/end_points.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/data/models/RegisterResponseDM.dart';
import 'package:e_commerece_online_c13/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/dataSourses/remoteDataSource/auth_remote_data_Source.dart';

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
  var registerResponse=RegisterResponseDm.fromJson(response.data);//convert response to object
  if(response.statusCode!>=200&&response.statusCode!<300){
    return Right(registerResponse);
  }
  else{
    return Left(ServerError(errorMsg: registerResponse.message!));
  }
  }
  
}