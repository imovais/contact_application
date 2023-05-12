import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Images {
  static AssetImage personicon =
      const AssetImage('assets/images/personicon.jpg');
}

//URL LAUNCHER FOR CALL
Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

//URL LAUNCHER Future<void> makePhoneCall(String phoneNumber) async {
Future<void> makeSms(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'sms',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}
