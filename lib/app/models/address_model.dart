class AddressModel {
  int? id;
  String? fullName;
  String? phoneNumber;
  String? country;
  String? city;
  String? street;
  bool? isPrimary;

  AddressModel(
      {this.id,
      this.fullName,
      this.phoneNumber,
      this.country,
      this.city,
      this.street,
      this.isPrimary});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    country = json['country'];
    city = json['city'];
    street = json['street'];
    isPrimary = json['isPrimary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['phoneNumber'] = this.phoneNumber;
    data['country'] = this.country;
    data['city'] = this.city;
    data['street'] = this.street;
    data['isPrimary'] = this.isPrimary;
    return data;
  }
}
