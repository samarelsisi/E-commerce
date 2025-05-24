import 'package:e_commerece_online_c13/domain/entities/AddItemToWishListResonseEntity.dart';

class AddItemToWishListResponseDm extends AddItemToWishListResponseEntity {
  AddItemToWishListResponseDm({
      super.status,
      super.message,
      super.data,});

  AddItemToWishListResponseDm.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['data'] = data;
    return map;
  }

}