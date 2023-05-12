import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Images {
  static AssetImage personicon =
      const AssetImage('assets/images/personicon.jpg');
}

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}
