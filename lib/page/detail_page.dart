import 'package:flutter/material.dart';
import 'package:hotelkhan/config/app_asset.dart';
import 'package:hotelkhan/config/app_color.dart';
import 'package:hotelkhan/config/app_route.dart';
import 'package:hotelkhan/model/hotel.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});
  final List facilities = [
    {
      'icon': AppAsset.iconCoffee,
      'label': 'Lounge',
    },
    {
      'icon': AppAsset.iconOffice,
      'label': 'Office',
    },
    {
      'icon': AppAsset.iconwifi,
      'label': 'Wi_Fi',
    },
    {
      'icon': AppAsset.iconStore,
      'label': 'Store',
    },
  ];

  @override
  Widget build(BuildContext context) {
    Hotel hotel = ModalRoute.of(context)!.settings.arguments as Hotel;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text(
          'Hotel Details',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoute.home);
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 24,
            ),
            images(hotel),
            const SizedBox(
              height: 16,
            ),
            name(hotel, context),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(hotel.description),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                'Facilities',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            gridFacilities(),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                'Activities',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 105,
            ),
          ],
        ),
      ),
    );
  }

  GridView gridFacilities() {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      itemCount: facilities.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[200]!,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(AssetImage(facilities[index]['icon'])),
              const SizedBox(
                height: 4,
              ),
              Text(
                facilities[index]['label'],
                style: const TextStyle(fontSize: 13),
              )
            ],
          ),
        );
      },
    );
  }

  Padding name(Hotel hotel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotel.name,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  hotel.location,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.star,
            color: AppColor.starActive,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            hotel.rate.toString(),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox images(Hotel hotel) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: hotel.image.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
              index == 0 ? 16 : 8,
              0,
              index == hotel.image.length - 1 ? 16 : 8,
              0,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                hotel.image[index],
                fit: BoxFit.cover,
                height: 180,
                width: 240,
              ),
            ),
          );
        },
      ),
    );
  }
}
