import 'package:get/get.dart';

import 'package:hotelkhan/model/user.dart';

class CUser extends GetxController {
  final _data = User(id: '', name: '', email: '', password: '').obs;
  User get data => _data.value;
  setData(n) => _data.value = n;
}
