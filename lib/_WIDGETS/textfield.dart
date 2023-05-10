// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

Widget text_field({hint_text, obs_text = false, prefix_icon, mycontroller}) {
  return Container(
    //height: 40,
    child: TextField(
      controller: mycontroller,
      obscureText: obs_text,
      decoration: InputDecoration(
          prefixIcon: prefix_icon,
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hint_text,
          contentPadding: EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade600),
              borderRadius: BorderRadius.circular(0))),
    ),
  );
}
