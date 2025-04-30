import 'package:e_commerece_online_c13/data/models/ProductResponseDM.dart';
import 'package:e_commerece_online_c13/domain/entities/GetCartResponeEntity.dart';

class GetCartResponseDm  extends GetCartResponeEntity{
  GetCartResponseDm({
     super.status,
     super.numOfCartItems,
   super.cartId,
      super.data,this.statusMsg,this.message
  });

  GetCartResponseDm.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? GetDataDM.fromJson(json['data']) : null;
  }
  String?message;
  String? statusMsg;
}

class GetDataDM extends GetDataEntity {
  GetDataDM({
      super.id,
      super.cartOwner,
     super.products,
      super.createdAt,
      super.updatedAt,
     super.v,
      super.totalCartPrice,});

  GetDataDM.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(GetProductsDM.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }



}

class GetProductsDM  extends GetProductsEntity{
  GetProductsDM({
      super.count,
      super.id,
      super.product,
     super.price,});

  GetProductsDM.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null ? ProductDM.fromJson(json['product']) : null;
    price = json['price'];
  }



}