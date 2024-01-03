import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelkhan/config/app_color.dart';
import 'package:hotelkhan/config/app_route.dart';
import 'package:hotelkhan/config/session.dart';
import 'package:hotelkhan/firebase_options.dart';
import 'package:hotelkhan/model/user.dart';
import 'package:hotelkhan/page/home_page.dart';
import 'package:hotelkhan/page/intro_page.dart';
import 'package:hotelkhan/page/signin_page.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: AppColor.backgroundScaffold,
        primaryColor: AppColor.primary,
        colorScheme: const ColorScheme.light(
          primary: AppColor.primary,
          secondary: AppColor.secondary,
        ),
      ),
      routes: {
        '/': (context) {
          return FutureBuilder(
            future: Session.getUser(),
            builder: (context, AsyncSnapshot<User> snapshot) {
              if (snapshot.data == null || snapshot.data!.id == null) {
                return const IntroPage();
              } else {
                return const HomePage();
              }
            },
          );
        },
        AppRoute.intro: (context) => const IntroPage(),
        AppRoute.home: (context) => const HomePage(),
        AppRoute.signin: (context) => SigninPage(),
        AppRoute.detail: (context) => const IntroPage(),
        AppRoute.checkout: (context) => const IntroPage(),
        AppRoute.checkoutSuccess: (context) => const IntroPage(),
        AppRoute.detailBooking: (context) => const IntroPage(),
      },
    );
  }
}
