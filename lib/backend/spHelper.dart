
import 'package:get/get.dart';
import 'package:graduation_project/models/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
  SPHelper._();
  static final SPHelper spHelper = SPHelper._();
  SharedPreferences prefs;

  Future<SharedPreferences> initSharedPreferences() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
    return prefs;
  }

////////////////////////////////////////////////////////////////////////////////
  saveUser(AppUser userModel) {
    prefs.setString('userName', userModel.userName);
    prefs.setString('userId', userModel.userId);
    prefs.setString('userEmail', userModel.email);
  }

  AppUser getUser() {
    String userId = prefs.getString('userId');
    String userName = prefs.getString('userName');
    String userEmail = prefs.getString('userEmail');
    if (userId != null)
      return AppUser(email: userEmail, userId: userId, userName: userName);
    return null;
  }

  clearData() {
    prefs.clear();
  }
}
