// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

Widget myform({required mynamecontroller, required myphonecontroller}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      TextField(
        
        controller: mynamecontroller,
        decoration: InputDecoration(label: Text('Name')),
      ),
      TextField(
        controller: myphonecontroller,
        decoration: InputDecoration(label: Text('Phone')),
      ),
    ],
  );
}
