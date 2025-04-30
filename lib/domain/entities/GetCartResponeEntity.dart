import 'package:e_commerece_online_c13/domain/entities/ProductResponseEntity.dart';

class GetCartResponeEntity {
  GetCartResponeEntity({
      this.status, 
      this.numOfCartItems, 
      this.cartId, 
      this.data,});
  String? status;
  num? numOfCartItems;
  String? cartId;
  GetDataEntity? data;

}


class GetDataEntity {
  GetDataEntity({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});


  String? id;
  String? cartOwner;
  List<GetProductsEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

}


class GetProductsEntity {
  GetProductsEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  num? count;
  String? id;
  ProductEntity? product;
  num? price;


}



