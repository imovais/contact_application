// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../_UTILS/data.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({this.myindex, super.key});

  final myindex;

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
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                ),
                padding: EdgeInsets.only(top: 100, bottom: 30),
                width: 100,
                height: 100,
                child:
                    Text(Data.contact[myindex]['name'].toString()[0].toUpperCase()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
