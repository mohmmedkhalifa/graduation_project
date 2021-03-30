class AdminModel {
  String email;
  bool isAdmin;
  String mobileNumber;
  String userName;

  AdminModel({this.email, this.isAdmin, this.mobileNumber, this.userName});

  AdminModel.fromMap(Map<String, dynamic> json) {
    email = json['email'];
    isAdmin = json['isAdmin'];
    mobileNumber = json['mobileNumber'];
    userName = json['userName'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['isAdmin'] = this.isAdmin;
    data['mobileNumber'] = this.mobileNumber;
    data['userName'] = this.userName;
    return data;
  }
}
