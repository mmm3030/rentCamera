class ServiceModels {
  String? name;
  String? imgUrl;
  String? count;

  ServiceModels({this.name, this.imgUrl, this.count});

  ServiceModels.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imgUrl = json['imgUrl'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, String>{};
    data['name'] = name;
    data['imgUrl'] = imgUrl;
    data['count'] = count;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
