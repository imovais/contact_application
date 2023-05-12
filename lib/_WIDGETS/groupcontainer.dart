// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

Widget groupcontainer(
    {required String heading, String subheading = '', required Color bgcolor}) {
  return Container(
    width: 150,
    height: 150,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(20), color: bgcolor),
    child: Padding(
      padding: const EdgeInsets.only(left: 10, top: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          Text(
            subheading,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          )
        ],
      ),
    ),
  );
}
