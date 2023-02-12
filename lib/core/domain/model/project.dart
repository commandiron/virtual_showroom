import 'dart:math';

class Project {
  String id;
  String companyLogoPath;
  int primaryColorValue;
  String companyPhone;
  String companyMail;
  String companyAddress;
  String companyLocationUrl;
  List<String> enabledPageRoutes;
  String name;
  String locationUrl;
  List<String> generalImagePaths;
  List<Apartment> apartments;
  DateTime startDate;
  DateTime estimatedFinishDate;
  List<String> features;

  Project({
    required this.id,
    required this.companyLogoPath,
    required this.primaryColorValue,
    required this.companyPhone,
    required this.companyMail,
    required this.companyAddress,
    required this.companyLocationUrl,
    required this.enabledPageRoutes,
    required this.name,
    required this.locationUrl,
    required this.generalImagePaths,
    required this.apartments,
    required this.startDate,
    required this.estimatedFinishDate,
    required this.features,
  });

  Map<String, dynamic> toJson() => {
      "id": id,
      "companyLogoPath": companyLogoPath,
      "primaryColorValue": primaryColorValue,
      "companyPhone": companyPhone,
      "companyMail": companyMail,
      "companyAddress": companyAddress,
      "companyLocationUrl": companyLocationUrl,
      "enabledPageRoutes": enabledPageRoutes,
      "name": name,
      "locationUrl": locationUrl,
      "generalImagePaths": generalImagePaths,
      "apartments":
          apartments.map((apartment) => apartment.toJson()).toList(),
      "startDate": startDate.toIso8601String(),
      "estimatedFinishDate": estimatedFinishDate.toIso8601String(),
      "features": features
    };

  Project.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      companyLogoPath = json["companyLogoPath"],
      primaryColorValue = json["primaryColorValue"],
      companyPhone = json["companyPhone"],
      companyMail = json["companyMail"],
      companyAddress = json["companyAddress"],
      companyLocationUrl = json["companyLocationUrl"],
      enabledPageRoutes = (json["enabledPageRoutes"] as List<dynamic>).map((e) => e.toString()).toList(), 
      name = json["name"],
      locationUrl = json["locationUrl"],
      generalImagePaths = (json["generalImagePaths"] as List<dynamic>).map((e) => e.toString()).toList(),
      apartments = (json["apartments"] as List<dynamic>).map((e) => Apartment.fromJson(e)).toList(),
      startDate = DateTime.parse(json["startDate"] as String),
      estimatedFinishDate = DateTime.parse(json["estimatedFinishDate"]),
      features = (json["features"]  as List<dynamic>).map((e) => e.toString()).toList();

  static List<Project> projects = [
    Project(
      id: "0",
      companyLogoPath: "assets/id0/demirli_ins_logo.png",
      primaryColorValue: 0xff137CC0,
      companyPhone: "+902163300300",
      companyMail: "info@demirli.com.tr",
      companyAddress:
          "Yıldızbakkal Taşköprü Cad. Demirli İş Merkezi Kadıköy - İSTANBUL",
      companyLocationUrl: "https://goo.gl/maps/pUvD8P7sWb4NzitK7",
      enabledPageRoutes: [
        "overview",
        "plans",
        "project_info",
        "ar",
      ],
      name: "Suadiye | Oran Apartmanı",
      locationUrl: "https://goo.gl/maps/HJdvb8UVM1TnqSx69",
      generalImagePaths: ["assets/id0/image_1.jpg", "assets/id0/image_2.jpg"],
      apartments: [
        Apartment(
            id: 0,
            title: "8. Kat Normal Daire",
            imagePaths: ["assets/id0/image_3.jpeg"],
            type: "5+1",
            netArea: "212",
            grossArea: "268"),
        Apartment(
            id: 1,
            title: "9-10. Kat Dubleks Daire",
            imagePaths: ["assets/id0/image_4.jpg", "assets/id0/image_5.jpg"],
            type: "5+2",
            netArea: "376",
            grossArea: "475"),
      ],
      startDate: DateTime(2022, 10, 7),
      estimatedFinishDate: DateTime(2023, 12, 7),
      features: [
        "C40 Beton",
        "Kayalık Zemin",
        "Akıllı Ev",
        "Deniz Manzarası",
        "Önü Kapanmaz Konum",
        "2 Adet + Misafir Otoparkı",
        "Prekast Cephe",
        "Ferforje Korkuluk",
        "Giyotin Balkon",
        "Yerden Isıtma",
        "Lamine Parke",
        "Tam Besleme Jeneratör",
        "Ytong Duvar",
        "Braas Çatı",
        "Lobi Tip Bina Girişi",
        "Görüntülü - Kameralı Diafon",
        "Kameralı Güvenlik Sistemi",
        "Aydınlatma Kontrolü",
        "Panjur Kontrolü",
        "Zip Perde Kontrolü",
        "Gaz Kaçağı Güvenliği",
        "Su Baskını Güvenliği",
        "Yangın Güvenliği",
      ],
    ),
  ];
}

class Apartment {
  int id;
  String title;
  List<String> imagePaths;
  String type;
  String netArea;
  String grossArea;

  Apartment({
    required this.id,
    required this.title,
    required this.imagePaths,
    required this.type,
    required this.netArea,
    required this.grossArea,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "imagePaths": imagePaths,
        "type": type,
        "netArea": netArea,
        "grossArea": grossArea
      };

  Apartment.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        imagePaths = (json["imagePaths"] as List<dynamic>).map((e) => e.toString()).toList(),
        type = json["type"],
        netArea = json["netArea"],
        grossArea = json["grossArea"];
}
