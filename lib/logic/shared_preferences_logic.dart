import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLogic {
  static const String keyUserID = 'userID';

  static const String keyUserName = 'userName';

  //端末にuser_idを保存する
  Future<void> saveUserID(String userID) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(keyUserID, userID);
    print('$userIDを保存');
  }

  //端末にuser_nameを保存する
  Future<void> saveUserName(String userName) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(keyUserName, userName);
    print('$userNameを保存');
  }

  //端末からuser_idを取得する
  Future<String?> getUserID() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(keyUserID);
  }

  //端末からuser_nameを取得する
  Future<String?> getUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(keyUserName);
  }
}
