class ProfileModel {
  int? id;
  String? userName;
  String? email;
  bool? emailConfirmed;
  String? phoneNumber;
  String? fullName;
  int? status;
  String? avatarUrl;
  int? totalQuantityItemInCart;

  ProfileModel(
      {this.id,
      this.userName,
      this.email,
      this.emailConfirmed,
      this.phoneNumber,
      this.fullName,
      this.status,
      this.avatarUrl,
      this.totalQuantityItemInCart});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    emailConfirmed = json['emailConfirmed'];
    phoneNumber = json['phoneNumber'];
    fullName = json['fullName'];
    status = json['status'];
    avatarUrl = json['avatarUrl'];
    totalQuantityItemInCart = json['totalQuantityItemInCart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['emailConfirmed'] = this.emailConfirmed;
    data['phoneNumber'] = this.phoneNumber;
    data['fullName'] = this.fullName;
    data['status'] = this.status;
    data['avatarUrl'] = this.avatarUrl;
    data['totalQuantityItemInCart'] = this.totalQuantityItemInCart;
    return data;
  }

  @override
  String toString() {
  return toJson().toString();    
  }
}
