class SellerModel {
  String address;
  String companyName;
  String email;
  bool isActive;
  bool isSeller;
  String logoUrl;
  String mobileNumber;
  String userName;
  String sellerId;
  String storeDescription;
  String age;
  String chatWith;

  SellerModel(
      {this.address,
      this.companyName,
      this.email,
      this.isActive,
      this.isSeller,
      this.logoUrl,
      this.mobileNumber,
      this.userName,
      this.sellerId,
      this.storeDescription,
      this.age,
      this.chatWith});

  SellerModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    companyName = json['companyName'];
    email = json['email'];
    isActive = json['isActive'];
    isSeller = json['isSeller'];
    logoUrl = json['logoUrl'];
    mobileNumber = json['mobileNumber'];
    userName = json['userName'];
    sellerId = json['sellerId'];
    storeDescription = json['storeDescription'];
    age = json['age'];
    chatWith = json['chatWith'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['companyName'] = this.companyName;
    data['email'] = this.email;
    data['isActive'] = this.isActive;
    data['isSeller'] = this.isSeller;
    data['logoUrl'] = this.logoUrl;
    data['mobileNumber'] = this.mobileNumber;
    data['userName'] = this.userName;
    data['sellerId'] = this.sellerId;
    data['storeDescription'] = this.storeDescription;
    data['age'] = this.age;
    data['chatWith'] = this.chatWith;
    return data;
  }
}
