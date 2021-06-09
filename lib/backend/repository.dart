import 'package:get/get.dart';
import 'package:graduation_project/models/sellerModel.dart';
import 'package:graduation_project/models/userModel.dart';

class Repository extends GetxController {
  Repository._();

  List<SellerModel> sellers = [];
  static Repository repository = Repository._();
  AppUser appUser;
}
