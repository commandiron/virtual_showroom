class Project {
  String name;
  DateTime startDate;
  DateTime estimatedFinishDate;
  String locationUrl;
  String companyPhone;
  String companyMail;
  String companyAddress;
  String companyLocationUrl;
  String companyLogoUrl;
  List<String> projectImageUrls;
  List<Apartment> apartments;
  List<String> features;

  String templateVersion;
  int primaryColorValue;
  List<String> enabledPageRoutes;

  bool isPaymentApproved;

  Project({
    required this.name,
    required this.startDate,
    required this.estimatedFinishDate,
    required this.locationUrl,
    required this.companyPhone,
    required this.companyMail,
    required this.companyAddress,
    required this.companyLocationUrl,
    required this.companyLogoUrl,
    required this.projectImageUrls,
    required this.apartments,
    required this.features,

    //Default Values
    this.templateVersion = "v1",
    this.primaryColorValue = 0xffFF5D12,
    this.enabledPageRoutes = const [
      "overview",
      "plans",
      "project_info",
      "ar",
    ],
    this.isPaymentApproved = false
  });

  Map<String, dynamic>  toJson() => {
    "companyPhone": companyPhone,
    "companyMail": companyMail,
    "companyAddress": companyAddress,
    "companyLocationUrl": companyLocationUrl,
    "enabledPageRoutes": enabledPageRoutes,
    "name": name,
    "locationUrl": locationUrl,
    "projectImageUrls": projectImageUrls,
    "apartments": apartments.map((apartment) => apartment.toJson()).toList(),
    "startDate": startDate.toIso8601String(),
    "estimatedFinishDate": estimatedFinishDate.toIso8601String(),
    "features": features,

    "templateVersion": templateVersion,
    "companyLogoUrl": companyLogoUrl,
    "primaryColorValue": primaryColorValue,
    "isPaymentApproved": isPaymentApproved
  };

  Project.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        startDate = DateTime.parse(json["startDate"] as String),
        estimatedFinishDate = DateTime.parse(json["estimatedFinishDate"]),
        locationUrl = json["locationUrl"],
        companyPhone = json["companyPhone"],
        companyMail = json["companyMail"],
        companyAddress = json["companyAddress"],
        companyLocationUrl = json["companyLocationUrl"],
        companyLogoUrl = json["companyLogoUrl"],
        projectImageUrls = (json["projectImageUrls"] as List<dynamic>).map((e) => e.toString()).toList(),
        apartments = (json["apartments"] as List<dynamic>).map((e) => Apartment.fromJson(e)).toList(),
        features = (json["features"]  as List<dynamic>).map((e) => e.toString()).toList(),

        templateVersion = json["templateVersion"],
        primaryColorValue = json["primaryColorValue"],
        enabledPageRoutes = (json["enabledPageRoutes"] as List<dynamic>).map((e) => e.toString()).toList(),
        isPaymentApproved = json["isPaymentApproved"];
}

class Apartment {
  List<String> imageUrls;
  String title;
  String type;
  String netArea;

  Apartment({
    required this.imageUrls,
    required this.title,
    required this.type,
    required this.netArea,
  });

  Map<String, dynamic> toJson() => {
    "title": title,
    "imageUrls": imageUrls,
    "type": type,
    "netArea": netArea,
  };

  Apartment.fromJson(Map<String, dynamic> json)
      : imageUrls = (json["imageUrls"] as List<dynamic>).map((e) => e.toString()).toList(),
        title = json["title"],
        type = json["type"],
        netArea = json["netArea"];
}
