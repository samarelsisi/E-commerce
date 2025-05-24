import 'package:e_commerece_online_c13/domain/entities/ProductResponseEntity.dart';

class GetWishListResponseEntity {
  GetWishListResponseEntity({
      this.status, 
      this.count, 
      this.data,});


  String? status;
  num? count;
  List<ProductEntity>? data;
}
class Category {
  Category({
      this.id,
      this.name,
      this.slug,
      this.image,});

  String? id;
  String? name;
  String? slug;
  String? image;
}

class Subcategory {
  Subcategory({
      this.id,
      this.name,
      this.slug,
      this.category,});

  String? id;
  String? name;
  String? slug;
  String? category;



}