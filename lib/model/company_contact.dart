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

  static List<CompanyContact> items = [
    CompanyContact(
      title: "Telefon",
      body: "0216 330 03 00",
      androidUrl: "tel:+902163300300",
      iosUrl: "mailto:info@demirli.com.tr",
      icon: Icons.phone,
    ),
    CompanyContact(
      title: "E posta",
      body: "info@demirli.com.tr",
      androidUrl: "mailto:info@demirli.com.tr",
      iosUrl: "mailto:info@demirli.com.tr",
      icon: Icons.mail,
    ),
    CompanyContact(
      title: "Ofis",
      body: "Yıldızbakkal Taşköprü Cad. Demirli İş Merkezi Kadıköy - İSTANBUL",
      androidUrl: "https://goo.gl/maps/RNiqv558Wzu3nqeR7",
      iosUrl: "https://maps.apple.com/?address=%C4%B0nki%C5%9Faf%20Sk.%2025,%2034718%20Kad%C4%B1k%C3%B6y%20%C4%B0stanbul,%20T%C3%BCrkiye&auid=7770429459415858637&ll=40.995059,29.033033&lsp=9902&q=Demirli%20%C4%B0n%C5%9Faat&t=m",
      icon: Icons.location_on,
    ),
  ];
}