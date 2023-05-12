// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

Widget popupmenubtn() {
  return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      onSelected: (value) {
        if (value == 1) {
          print('this is value 1');
        }
        if (value == 2) {
          print('this is value 2');
        }
        if (value == 3) {
          print('this is value 3');
        }
      },
      itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: Text('Call'),
            ),
            PopupMenuItem(
              value: 2,
              child: Text('Sms'),
            ),
            PopupMenuItem(
              value: 3,
              child: Text('Add to Favourite'),
            ),
            PopupMenuItem(
              value: 3,
              child: Text('Delete'),
            ),
          ]);
}
