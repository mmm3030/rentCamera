class UserModel {
  int? id;
  String? userName;
  String? fullName;
  String? avatarUrl;

  UserModel({this.id, this.userName, this.fullName, this.avatarUrl});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    fullName = json['fullName'];
    avatarUrl = json['avatarUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['fullName'] = this.fullName;
    data['avatarUrl'] = this.avatarUrl;
    return data;
  }
}
