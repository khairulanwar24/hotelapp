import 'package:get/get.dart';
import 'package:hotelkhan/model/hotel.dart';
import 'package:hotelkhan/source/hotel_source.dart';

class CNearby extends GetxController {
  final _category = 'All Place'.obs;
  String get category => _category.value;
  set category(n) {
    _category.value = n;
    update();
  }

  List<String> get categories => [
        'All Place',
        'Industrial',
        'Village',
      ];

  final _listHotel = <Hotel>[].obs;
  List<Hotel> get listHotel => _listHotel;

  getListHotel() async {
    _listHotel.value = await HotelSource.getHotel();
    update();
  }

  @override
  void onInit() {
    //onInit merujuknya ke GetXController
    getListHotel();
    super.onInit();
  }
}
