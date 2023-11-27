class ImageModel {
  int? id;
  String? imageUrl;

  ImageModel({this.id, this.imageUrl});

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
