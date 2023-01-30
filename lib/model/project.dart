import 'package:flutter/material.dart';
import 'package:virtual_showroom/model/company_contact.dart';

class Project {
  List<CompanyContact> companyContacts;
  String companyLogoPath;
  String name;
  List<String> generalImagePaths;
  List<String> planImagePaths;
  DateTime startDate;
  DateTime estimatedFinishDate;

  Project(
    {
      required this.companyContacts,
      required this.companyLogoPath,
      required this.name,
      required this.generalImagePaths,
      required this.planImagePaths,
      required this.startDate,
      required this.estimatedFinishDate
    }
  );

  static Project project1 = Project(
    companyContacts: [
      CompanyContact(
        title: "Telefon",
        body: "0216 330 03 00",
        androidUrl: "tel:+902163300300",
        iosUrl: "tel:+902163300300",
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
    ],
    companyLogoPath: "assets/demirli_ins_logo.png",
    name: "Suadiye | Oran Apartmanı",
    generalImagePaths: [
      "assets/image_1.jpg",
      "assets/image_2.jpg"
    ],
    planImagePaths: [
      "assets/image_3.jpeg",
      "assets/image_4.jpg",
      "assets/image_5.jpg"
    ],
    startDate: DateTime(
        2022, 10, 7
    ),
    estimatedFinishDate: DateTime(
      2023, 11, 7
    )
  );
}