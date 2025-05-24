import 'package:e_commerece_online_c13/data/models/ProductResponseDM.dart';
import 'package:e_commerece_online_c13/domain/entities/GetWishListResponseEntity.dart';

class GetWishListResponseDm  extends GetWishListResponseEntity{
  GetWishListResponseDm({
      super.status,
      super.count,
      super.data,
    this.message,
    this.statusMsg

  });
  String?message;
  String? statusMsg;
  GetWishListResponseDm.fromJson(dynamic json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDM.fromJson(v));
      });
    }
  }
}
class Subcategory {
  Subcategory({
      this.id, 
      this.name, 
      this.slug, 
      this.category,});

  Subcategory.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
  String? id;
  String? name;
  String? slug;
  String? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    return map;
  }

}