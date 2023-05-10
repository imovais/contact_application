// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:contact_app/_WIDGETS/textfield.dart';
import 'package:flutter/material.dart';

Widget myform(
    {required mynamecontroller,
    required myphonecontroller,
    required mysurnamecontroller}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Name'),
      SizedBox(
        height: 10,
      ),
      text_field(
        hint_text: 'Enter Name',
        mycontroller: mynamecontroller,
      ),
      SizedBox(
        height: 10,
      ),
      text_field(
        hint_text: 'Surname',
        mycontroller: mysurnamecontroller,
      ),
      SizedBox(
        height: 10,
      ),
      Text('Phone Number'),
      SizedBox(
        height: 10,
      ),
      text_field(
        hint_text: '03__ ________',
        mycontroller: myphonecontroller,
      )
    ],
  );
}
