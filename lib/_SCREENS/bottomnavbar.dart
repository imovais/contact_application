// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:contact_app/_SCREENS/homescreen.dart';
import 'package:contact_app/_SCREENS/recent_history.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _seletedtab = 0;

  final List _pages = [
    RecentHistory(),
    HomeScreen(),
    Center(
      child: Text("Products"),
    )
  ];

  _onchangetab(int index) {
    setState(() {
      _seletedtab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_seletedtab],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _seletedtab,
          onTap: (value) => _onchangetab(value),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Recents'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Contacts'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Groups'),
          ]),
    );
  }
}
