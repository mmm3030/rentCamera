class CartModel {
  int? id;
  int? quantity;
  String? startDate;
  String? endDate;
  int? productId;

  CartModel(
      {this.id, this.quantity, this.startDate, this.endDate, this.productId});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['productId'] = this.productId;
    return data;
  }
}
