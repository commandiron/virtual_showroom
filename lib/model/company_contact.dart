import 'package:flutter/material.dart';

class CompanyContact {
  String title;
  String body;
  String url;
  IconData icon;

  CompanyContact(
    {
      required this.title,
      required this.body,
      required this.url,
      required this.icon,
    }
  );

  static List<CompanyContact> items = [
    CompanyContact(
      title: "Telefon",
      body: "0216 330 03 00",
      url: "tel:+902163300300",
      icon: Icons.phone,
    ),
    CompanyContact(
      title: "E posta",
      body: "info@demirli.com.tr",
      url: "mailto:info@demirli.com.tr",
      icon: Icons.mail,
    ),
    CompanyContact(
      title: "Ofis",
      body: "Yıldızbakkal Taşköprü Cad. Demirli İş Merkezi Kadıköy - İSTANBUL",
      url: "https://goo.gl/maps/RNiqv558Wzu3nqeR7",
      icon: Icons.location_on,
    ),
  ];
}