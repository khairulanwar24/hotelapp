import 'dart:convert';

import 'package:get/get.dart';
import 'package:hotelkhan/controller/c_user.dart';
import 'package:hotelkhan/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Session {
  // menyimpan session user
  static Future<bool> saveUser(User user) async {
    final pref = await SharedPreferences.getInstance();
    Map<String, dynamic> mapUser = user.toJson();
    String stringUser = jsonEncode(mapUser);
    bool success = await pref.setString('user', stringUser);
    if (success) {
      final cUser = Get.put(CUser());
      cUser.setData(user);
    }
    return success;
  }

  // ambil  session user
  static Future<User> getUser() async {
    User user =
        User(id: '', name: '', email: '', password: ''); // default value
    final pref = await SharedPreferences.getInstance();
    String? stringUser = pref.getString('user');
    if (stringUser != null) {
      Map<String, dynamic> mapUser = jsonDecode(stringUser);
      user = User.fromJson(mapUser);
    }
    final cUser = Get.put(CUser());
    cUser.setData(user);
    return user;
  }

  static Future<bool> clearUser() async {
    final pref = await SharedPreferences.getInstance();
    bool success = await pref.remove('user');
    final cUser = Get.put(CUser());
    cUser.setData(CUser());
    return success;
  }
}
