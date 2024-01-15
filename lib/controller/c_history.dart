import 'package:get/get.dart';

import '../model/booking.dart';
import '../source/booking_source.dart';

class CHistory extends GetxController {
  final _listHistory = <Booking>[].obs;
  List<Booking> get listHistory => _listHistory.value;

  getListBooking(String id) async {
    _listHistory.value = await BookingSource.getHistory(id);
    update();
  }
}
