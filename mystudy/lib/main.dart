// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mystudy/pages/home_page.dart';
import 'package:mystudy/pages/home_page_withfb.dart';
import 'package:mystudy/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> getInitialState() async {
  final pref = await SharedPreferences.getInstance();
  final isLoggedIn = pref.getBool("isLoggedIn") ?? false;
  return isLoggedIn;
}

void main() {
  runApp(MaterialApp(
    title: "Awesome App",
    home: LoginPage(),
    // home: FutureBuilder(
    //     future: getInitialState(),
    //     builder: (context, snapshot) {
    //       if (snapshot.data == false) {
    //         return LoginPage();
    //       }
    //       return HomePage();
    //     }),
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    routes: {
      "/login": (context) => LoginPage(),
      "/home": (context) => HomePageFb(),
    },
  ));
}
