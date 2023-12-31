import 'package:get/get.dart';

class CUser extends GetxController {
  final _data = CUser().obs;
  CUser get data => _data.value;
  setData(n) => _data.value = n;
}
