class Project {
  String id;
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

  DateTime trialExpirationDate;
  DateTime expirationDate;

  String templateVersion;
  int primaryColorValue;
  List<String> enabledPageRoutes;

  PaymentStatus paymentStatus;

  Project({
    required this.id,
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

    required this.trialExpirationDate,
    required this.expirationDate,

    //Default Values
    this.templateVersion = "v1",
    this.primaryColorValue = 0xffFF5D12,
    this.enabledPageRoutes = const [
      "overview",
      "plans",
      "project_info",
      "ar",
    ],
    this.paymentStatus = PaymentStatus.selectPlan
  });

  Map<String, dynamic>  toJson() => {
    "id": id,
    "name": name,
    "startDate": startDate.toIso8601String(),
    "estimatedFinishDate": estimatedFinishDate.toIso8601String(),
    "locationUrl": locationUrl,
    "companyPhone": companyPhone,
    "companyMail": companyMail,
    "companyAddress": companyAddress,
    "companyLocationUrl": companyLocationUrl,
    "companyLogoUrl": companyLogoUrl,
    "projectImageUrls": projectImageUrls,
    "apartments": apartments.map((apartment) => apartment.toJson()).toList(),
    "features": features,

    "trialExpirationDate": trialExpirationDate.toIso8601String(),
    "expirationDate": expirationDate.toIso8601String(),

    "templateVersion": templateVersion,
    "primaryColorValue": primaryColorValue,
    "enabledPageRoutes": enabledPageRoutes,
    "paymentStatus": paymentStatus.name
  };

  Project.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
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

        trialExpirationDate = DateTime.parse(json["trialExpirationDate"] as String),
        expirationDate = DateTime.parse(json["expirationDate"] as String),

        templateVersion = json["templateVersion"],
        primaryColorValue = json["primaryColorValue"],
        enabledPageRoutes = (json["enabledPageRoutes"] as List<dynamic>).map((e) => e.toString()).toList(),
        paymentStatus = PaymentStatus.values.firstWhere((value) => value.name == json["paymentStatus"]);
}

class Apartment {
  List<String> imageUrls;
  String title;
  String type;
  String netArea;
  String price;

  Apartment({
    required this.imageUrls,
    required this.title,
    required this.type,
    required this.netArea,
    required this.price,
  });

  Map<String, dynamic> toJson() => {
    "title": title,
    "imageUrls": imageUrls,
    "type": type,
    "netArea": netArea,
    "price": price,
  };

  Apartment.fromJson(Map<String, dynamic> json)
      : imageUrls = (json["imageUrls"] as List<dynamic>).map((e) => e.toString()).toList(),
        title = json["title"],
        type = json["type"],
        netArea = json["netArea"],
        price = json["price"];
}

enum PaymentStatus {
  selectPlan, pendingStandardPlan, pendingPersonalizedPlan, approved,
}