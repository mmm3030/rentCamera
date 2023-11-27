import 'package:rent_camera/app/models/category_model.dart';
import 'package:rent_camera/app/models/image_model.dart';

class ProductModel {
  String? name;
  String? description;
  double? amount;
  int? unitsInStock;
  int? totalReviews;
  dynamic averageRating;
  bool? isInWislish;
  int? categoryId;
  CategoryModel? category;
  List<ImageModel>? images;
  int? id;
  String? createdBy;
  String? createdAt;
  String? modifiedBy;
  String? modifiedAt;

  ProductModel(
      {this.name,
      this.description,
      this.amount,
      this.unitsInStock,
      this.totalReviews,
      this.averageRating,
      this.isInWislish,
      this.categoryId,
      this.category,
      this.images,
      this.id,
      this.createdBy,
      this.createdAt,
      this.modifiedBy,
      this.modifiedAt});

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    amount = json['amount'];
    unitsInStock = json['unitsInStock'];
    totalReviews = json['totalReviews'];
    averageRating = json['averageRating'];
    isInWislish = json['isInWislish'];
    categoryId = json['categoryId'];
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
    if (json['images'] != null) {
      images = <ImageModel>[];
      json['images'].forEach((v) {
        images!.add(ImageModel.fromJson(v));
      });
    }
    id = json['id'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    modifiedBy = json['modifiedBy'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['amount'] = this.amount;
    data['unitsInStock'] = this.unitsInStock;
    data['totalReviews'] = this.totalReviews;
    // data['averageRating'] = this.averageRating;
    data['isInWislish'] = this.isInWislish;
    data['categoryId'] = this.categoryId;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
