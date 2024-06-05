import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper{
  static SharedPrefHelper? _instance;
  late SharedPreferences _prefs;

  String? email;
  String? password;
  SharedPrefHelper._();
  // Singleton instance
  static Future<SharedPrefHelper> getInstance() async {
    _instance ??= SharedPrefHelper._();
    _instance!._prefs = await SharedPreferences.getInstance();
    return _instance!;
  }

  Future<bool> saveUserEmail(String email) async {
    return await _prefs.setString('user_email', email);
  }

  // Get user email
  String? getUserEmail() {
    return _prefs.getString('user_email');
  }

  Future<bool> saveUser (String user) async {
    return await _prefs.setString('user', user);
  }

  String? getUser() {
    return _prefs.getString('user');
  }

  // Save user password
  Future<bool> saveUserPassword(String password) async {
    return await _prefs.setString('user_password', password);
  }

  // Get user password
  String? getUserPassword() {
    return _prefs.getString('user_password');
  }

 Future<void> clearAll()async {
    await _prefs.clear();
 }

}