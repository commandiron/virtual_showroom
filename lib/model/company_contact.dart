import 'package:flutter/material.dart';

class CompanyContact {
  String title;
  String body;
  String androidUrl;
  String iosUrl;
  IconData icon;

  CompanyContact(
    {
      required this.title,
      required this.body,
      required this.androidUrl,
      required this.iosUrl,
      required this.icon,
    }
  );
}