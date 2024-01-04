import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelkhan/config/app_asset.dart';
import 'package:hotelkhan/config/app_color.dart';
import 'package:hotelkhan/controller/c_home.dart';
import 'package:hotelkhan/page/nearby_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final cHome = Get.put(CHome());
  final List<Map> listNav = [
    {'icon': AppAsset.iconNearby, 'label': 'Nearby'},
    {'icon': AppAsset.iconHistory, 'label': 'History'},
    {'icon': AppAsset.iconPayment, 'label': 'Payment'},
    {'icon': AppAsset.iconReward, 'label': 'Reward'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (cHome.indexPage == 1) {
        return const Text('History Page');
      }
      return const NearbyPage();
    }), bottomNavigationBar: Obx(() {
      return Material(
        elevation: 8,
        child: Container(
          padding: const EdgeInsets.only(top: 8, bottom: 6),
          color: Colors.white,
          child: BottomNavigationBar(
              onTap: (value) => cHome.indexPage = value,
              currentIndex: cHome.indexPage,
              elevation: 0,
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed, // ukuran tiap icon sama
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              selectedIconTheme: const IconThemeData(
                color: AppColor.primary,
              ),
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              selectedFontSize: 12,
              items: listNav.map((e) {
                return BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(e['icon'])),
                  label: e['label'],
                );
              }).toList()),
        ),
      );
    }));
  }
}
