import 'package:e_commerece_online_c13/domain/entities/AddToCartResponseEntity.dart';

/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 6
/// cartId : "67f3c6617379fd935b08ec2d"
/// data : {"_id":"67f3c6617379fd935b08ec2d","cartOwner":"67aa6ac7fa7895e81f67b4e4","products":[{"count":2,"_id":"67f4a8957379fd935b0cf5fe","product":"6428e884dc1175abc65ca096","price":349},{"count":3,"_id":"67f503d47379fd935b0d582f","product":"6428ebc6dc1175abc65ca0b9","price":191},{"count":19,"_id":"67f503e67379fd935b0d583e","product":"6428eb43dc1175abc65ca0b3","price":149},{"count":4,"_id":"67f504297379fd935b0d5887","product":"6428ead5dc1175abc65ca0ad","price":149},{"count":1,"_id":"67f50db47379fd935b0d6530","product":"6428e509dc1175abc65ca07e","price":499},{"count":1,"_id":"67f5101c7379fd935b0d6baf","product":"6428dfa0dc1175abc65ca067","price":744}],"createdAt":"2025-04-07T12:34:41.273Z","updatedAt":"2025-04-16T20:35:56.640Z","__v":13,"totalCartPrice":5941}

class AddToCartResponseDm extends AddToCartResponseEntity {
  AddToCartResponseDm({
      super.status,
      super.message,
      super.numOfCartItems,
      super.cartId,
    this.statusMsg,
      super.data,});
  String? statusMsg;

  AddToCartResponseDm.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? DataCartDM.fromJson(json['data']) : null;
  }
}
/// _id : "67f3c6617379fd935b08ec2d"
/// cartOwner : "67aa6ac7fa7895e81f67b4e4"
/// products : [{"count":2,"_id":"67f4a8957379fd935b0cf5fe","product":"6428e884dc1175abc65ca096","price":349},{"count":3,"_id":"67f503d47379fd935b0d582f","product":"6428ebc6dc1175abc65ca0b9","price":191},{"count":19,"_id":"67f503e67379fd935b0d583e","product":"6428eb43dc1175abc65ca0b3","price":149},{"count":4,"_id":"67f504297379fd935b0d5887","product":"6428ead5dc1175abc65ca0ad","price":149},{"count":1,"_id":"67f50db47379fd935b0d6530","product":"6428e509dc1175abc65ca07e","price":499},{"count":1,"_id":"67f5101c7379fd935b0d6baf","product":"6428dfa0dc1175abc65ca067","price":744}]
/// createdAt : "2025-04-07T12:34:41.273Z"
/// updatedAt : "2025-04-16T20:35:56.640Z"
/// __v : 13
/// totalCartPrice : 5941

class DataCartDM extends DataCartEntity {
  DataCartDM({
      super.id,
      super.cartOwner,
      super.products,
      super.createdAt,
      super.updatedAt,
      super.v,
      super.totalCartPrice,});

  DataCartDM.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductsCartDM.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }



}

/// count : 2
/// _id : "67f4a8957379fd935b0cf5fe"
/// product : "6428e884dc1175abc65ca096"
/// price : 349

class AddProductsCartDM extends AddProductsCartEntity {
  AddProductsCartDM({
      super.count,
      super.id,
      super.product,
      super.price,});

  AddProductsCartDM.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
  num? count;
  String? id;
  String? product;
  num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }

}