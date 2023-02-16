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
