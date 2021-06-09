class AddressModel {
  String addressId;
  String customerId;
  String city;
  String address;

  AddressModel({
    this.addressId,
    this.customerId,
    this.city,
    this.address,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['addressId'];
    customerId = json['customerId'];
    city = json['city'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressId'] = this.addressId;
    data['customerId'] = this.customerId;
    data['city'] = this.city;
    data['address'] = this.address;
    return data;
  }
}
