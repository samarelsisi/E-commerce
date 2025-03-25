import 'package:dio/dio.dart';
import 'package:e_commerece_online_c13/core/api/api_constant.dart';
import 'package:injectable/injectable.dart';
@singleton
class ApiManager {
  Dio dio = Dio();

  Future <Response>getData(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Map<String, dynamic>? headers}) {
   return dio.get(ApiConstant.baseUrl + endPoint,
        queryParameters: queryParameters, options: Options(headers: headers,validateStatus: (status)=>true));
  }
  Future <Response>postData(
      {required String endPoint,
        Map<String, dynamic>? queryParameters,
        Options? options,
        Object? body,
        Map<String, dynamic>? headers}) {
    return dio.post(ApiConstant.baseUrl + endPoint,
        queryParameters: queryParameters,
        options: Options(headers: headers,validateStatus: (status)=>true),
        data: body,

    );
  }
}
