// ignore_for_file: prefer_const_constructors

//import 'package:contact_app/_SCREENS/homepage.dart';
import 'package:flutter/material.dart';

import '_SCREENS/bottomnavbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),

      //home: HomeScreen(),
    );
  }
}
