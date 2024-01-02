import 'package:flutter/material.dart';
import 'package:hotelkhan/config/app_asset.dart';
import 'package:hotelkhan/config/app_color.dart';
import 'package:hotelkhan/config/app_route.dart';
import 'package:hotelkhan/page/home_page.dart';
import 'package:hotelkhan/widget/button_custom.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  login(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAsset.logo,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(height: 80),
                    Text(
                      'Sign In\nTo Your Account',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      controller: controllerEmail,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        hintText: 'Email Address',
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: AppColor.secondary),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: controllerPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        hintText: 'Password',
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: AppColor.secondary),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ButtonCustom(
                      label: 'Sign In',
                      isExpand: true,
                      onTap: () => login(context),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Create New Account',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
