class ProjectModel {
  String? name;
  String? imgUrl;
  String? reviewCount;
  String? rating;
  String? casting;

  ProjectModel(
      {this.name, this.imgUrl, this.reviewCount, this.rating, this.casting});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imgUrl = json['imgUrl'];
    reviewCount = json['reviewCount'];
    rating = json['rating'];
    casting = json['casting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['imgUrl'] = imgUrl;
    data['reviewCount'] = reviewCount;
    data['rating'] = rating;
    data['casting'] = casting;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
