class CardModel {
  String? cardNumber;
  String? cardHolderName;
  String? cvv;
  int? expiryMonth;
  int? expiryYear;
  bool? isPrimary;
  int? creditCardTypeId;
  CreditCardType? creditCardType;
  int? id;
  String? createdBy;
  String? createdAt;
  String? modifiedBy;
  String? modifiedAt;

  CardModel(
      {this.cardNumber,
      this.cardHolderName,
      this.cvv,
      this.expiryMonth,
      this.expiryYear,
      this.isPrimary,
      this.creditCardTypeId,
      this.creditCardType,
      this.id,
      this.createdBy,
      this.createdAt,
      this.modifiedBy,
      this.modifiedAt});

  CardModel.fromJson(Map<String, dynamic> json) {
    cardNumber = json['cardNumber'];
    cardHolderName = json['cardHolderName'];
    cvv = json['cvv'];
    expiryMonth = json['expiryMonth'];
    expiryYear = json['expiryYear'];
    isPrimary = json['isPrimary'];
    creditCardTypeId = json['creditCardTypeId'];
    creditCardType = json['creditCardType'] != null
        ? new CreditCardType.fromJson(json['creditCardType'])
        : null;
    id = json['id'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    modifiedBy = json['modifiedBy'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardNumber'] = this.cardNumber;
    data['cardHolderName'] = this.cardHolderName;
    data['cvv'] = this.cvv;
    data['expiryMonth'] = this.expiryMonth;
    data['expiryYear'] = this.expiryYear;
    data['isPrimary'] = this.isPrimary;
    data['creditCardTypeId'] = this.creditCardTypeId;
    if (this.creditCardType != null) {
      data['creditCardType'] = this.creditCardType!.toJson();
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

class CreditCardType {
  int? id;
  String? name;

  CreditCardType({this.id, this.name});

  CreditCardType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
