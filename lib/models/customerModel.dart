class CustomerModel {
  String email;
  bool isActive;
  bool isCustomer;
  String logoUrl;
  String mobileNumber;
  String skills;
  String userName;
  String customerId;

  CustomerModel(
      {this.email,
      this.isActive,
      this.isCustomer,
      this.logoUrl,
      this.mobileNumber,
      this.skills,
      this.userName,
      this.customerId});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    isActive = json['isActive'];
    isCustomer = json['isCustomer'];
    logoUrl = json['logoUrl'];
    mobileNumber = json['mobileNumber'];
    skills = json['skills'];
    userName = json['userName'];
    customerId = json['customerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['isActive'] = this.isActive;
    data['isCustomer'] = this.isCustomer;
    data['logoUrl'] = this.logoUrl;
    data['mobileNumber'] = this.mobileNumber;
    data['skills'] = this.skills;
    data['userName'] = this.userName;
    data['customerId'] = this.customerId;
    return data;
  }
}
