import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hotelkhan/config/app_route.dart';
import 'package:hotelkhan/config/session.dart';
import 'package:hotelkhan/firebase_options.dart';
import 'package:hotelkhan/model/user.dart';
import 'package:hotelkhan/page/home_page.dart';
import 'package:hotelkhan/page/intro_page.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //package yg tipenya plugin (firebase auth, storage, atau firestore)
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  initializeDateFormatting('en_US');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) {
          return FutureBuilder(
            future: Session.getUser(),
            builder: (context, AsyncSnapshot<User> snapshot) {
              if (snapshot.data == null || snapshot.data!.id == null) {
                return const IntroPage();
              } else {
                return HomePage();
              }
            },
          );
        },
        AppRoute.intro: (context) => const IntroPage(),
        AppRoute.home: (context) => const HomePage(),
        AppRoute.signin: (context) => const SignIn(),
        AppRoute.detail: (context) => const Detail(),
        AppRoute.checkout: (context) => const Checkout(),
        AppRoute.checkoutSuccess: (context) => const CheckoutSuccess(),
        AppRoute.detailBooking: (context) => const DetailBooking(),
      },
    );
  }
}
