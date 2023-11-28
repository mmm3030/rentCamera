import 'package:rent_camera/app/models/user_model.dart';

class ReviewModel {
  String? title;
  String? description;
  dynamic rating;
  UserModel? user;
  int? id;
  String? createdBy;
  String? createdAt;
  String? modifiedBy;
  String? modifiedAt;

  ReviewModel(
      {this.title,
      this.description,
      this.rating,
      this.user,
      this.id,
      this.createdBy,
      this.createdAt,
      this.modifiedBy,
      this.modifiedAt});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    rating = json['rating'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    id = json['id'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    modifiedBy = json['modifiedBy'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['rating'] = this.rating;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['id'] = this.id;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
