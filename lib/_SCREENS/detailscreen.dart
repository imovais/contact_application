// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../_UTILS/const.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
          title: Text('Contact Detail'),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              color: Colors.grey.shade300,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fitWidth, image: Images.personicon),
                  color: Colors.grey.shade300,
                ),
                padding: EdgeInsets.only(top: 100, bottom: 30),
                width: 100,
                height: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
