class Project {
  String companyLogoUrl;
  int primaryColorValue;
  String companyPhone;
  String companyMail;
  String companyAddress;
  String companyLocationUrl;
  List<String> enabledPageRoutes;
  String name;
  String locationUrl;
  List<String> generalImageUrls;
  List<Apartment> apartments;
  DateTime startDate;
  DateTime estimatedFinishDate;
  List<String> features;

  Project({
    required this.companyLogoUrl,
    required this.primaryColorValue,
    required this.companyPhone,
    required this.companyMail,
    required this.companyAddress,
    required this.companyLocationUrl,
    required this.enabledPageRoutes,
    required this.name,
    required this.locationUrl,
    required this.generalImageUrls,
    required this.apartments,
    required this.startDate,
    required this.estimatedFinishDate,
    required this.features,
  });

  Map<String, dynamic> toJson() => {
    "companyLogoUrl": companyLogoUrl,
    "primaryColorValue": primaryColorValue,
    "companyPhone": companyPhone,
    "companyMail": companyMail,
    "companyAddress": companyAddress,
    "companyLocationUrl": companyLocationUrl,
    "enabledPageRoutes": enabledPageRoutes,
    "name": name,
    "locationUrl": locationUrl,
    "generalImageUrls": generalImageUrls,
    "apartments":
    apartments.map((apartment) => apartment.toJson()).toList(),
    "startDate": startDate.toIso8601String(),
    "estimatedFinishDate": estimatedFinishDate.toIso8601String(),
    "features": features
  };

  Project.fromJson(Map<String, dynamic> json)
      : companyLogoUrl = json["companyLogoUrl"],
        primaryColorValue = json["primaryColorValue"],
        companyPhone = json["companyPhone"],
        companyMail = json["companyMail"],
        companyAddress = json["companyAddress"],
        companyLocationUrl = json["companyLocationUrl"],
        enabledPageRoutes = (json["enabledPageRoutes"] as List<dynamic>).map((e) => e.toString()).toList(),
        name = json["name"],
        locationUrl = json["locationUrl"],
        generalImageUrls = (json["generalImageUrls"] as List<dynamic>).map((e) => e.toString()).toList(),
        apartments = (json["apartments"] as List<dynamic>).map((e) => Apartment.fromJson(e)).toList(),
        startDate = DateTime.parse(json["startDate"] as String),
        estimatedFinishDate = DateTime.parse(json["estimatedFinishDate"]),
        features = (json["features"]  as List<dynamic>).map((e) => e.toString()).toList();
}

class Apartment {
  int id;
  String title;
  List<String> imageUrls;
  String type;
  String netArea;
  String grossArea;

  Apartment({
    required this.id,
    required this.title,
    required this.imageUrls,
    required this.type,
    required this.netArea,
    required this.grossArea,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "imageUrls": imageUrls,
    "type": type,
    "netArea": netArea,
    "grossArea": grossArea
  };

  Apartment.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        imageUrls = (json["imageUrls"] as List<dynamic>).map((e) => e.toString()).toList(),
        type = json["type"],
        netArea = json["netArea"],
        grossArea = json["grossArea"];
}
