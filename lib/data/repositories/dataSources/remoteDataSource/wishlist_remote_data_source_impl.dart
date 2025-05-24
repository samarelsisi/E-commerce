import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/api/api_manager.dart';
import 'package:e_commerece_online_c13/core/api/end_points.dart';
import 'package:e_commerece_online_c13/core/cached/cache_helper.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/data/models/GetWishListResponseDM.dart';
import 'package:e_commerece_online_c13/domain/repositories/dataSourses/remoteDataSource/wishlist-remote-data-Source.dart';
import 'package:injectable/injectable.dart';
import '../../../models/AddItemToWishListResonseDm.dart';

@Injectable(as: WishListRemoteDataSource)
class WishlistRemoteDataSourceImpl implements WishListRemoteDataSource {
  @override
  ApiManager apiManager;

  WishlistRemoteDataSourceImpl({required this.apiManager});

  var token = SharedPrefernceUtlis.getData(key: "token");

  @override
  Future<Either<Failures, AddItemToWishListResponseDm>> AddItemToWishList(
      String productId) async {
    try {
      final List<ConnectivityResult> connectivityResult =
      await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var token = SharedPrefernceUtlis.getData(key: 'token');
        var response = await apiManager.postData(
            endPoint: EndPoints.wishList,
            body: {"productId": productId},
            headers: {'token': token});

        var addwishListResponse =
        AddItemToWishListResponseDm.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(addwishListResponse);
        } else {
          return Left(ServerError(errorMsg: addwishListResponse.message!));
        }
      } else {
        return Left(NetworkError(
            errorMsg: 'No Internet Connection, Please Check Internet.'));
      }
    } catch (e) {
      return Left(Failures(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetWishListResponseDm>> getItemsInWishList() async {
    var response = await apiManager.getData(
        endPoint: EndPoints.wishList, headers: {'token': token});
    try {
      final List<ConnectivityResult> connectivityResult =
      await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var getItemsInWishList =
        GetWishListResponseDm.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getItemsInWishList);
        } else {
          return Left(ServerError(errorMsg: getItemsInWishList.message!));
        }
      } else {
        return Left(NetworkError(
            errorMsg: 'No Internet Connection ,Please Check Internet'));
      }
    } catch (e) {
      return Left(Failures(errorMsg: e.toString()));
    }
  }
}
