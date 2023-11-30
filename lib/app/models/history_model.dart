class HistoryModel {
  double? totalAmount;
  int? totalQuantity;
  String? status;
  int? addressId;
  int? creditCardId;
  int? id;
  String? createdBy;
  String? createdAt;
  String? modifiedBy;
  String? modifiedAt;

  HistoryModel(
      {this.totalAmount,
      this.totalQuantity,
      this.status,
      this.addressId,
      this.creditCardId,
      this.id,
      this.createdBy,
      this.createdAt,
      this.modifiedBy,
      this.modifiedAt});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    totalAmount = json['totalAmount'];
    totalQuantity = json['totalQuantity'];
    status = json['status'];
    addressId = json['addressId'];
    creditCardId = json['creditCardId'];
    id = json['id'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    modifiedBy = json['modifiedBy'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalAmount'] = this.totalAmount;
    data['totalQuantity'] = this.totalQuantity;
    data['status'] = this.status;
    data['addressId'] = this.addressId;
    data['creditCardId'] = this.creditCardId;
    data['id'] = this.id;
    data['createdBy'] = this.createdBy;
    data['createdAt'] = this.createdAt;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
