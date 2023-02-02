import '../virtual_show_room/pages/ar.dart';
import '../virtual_show_room/pages/general_images.dart';
import '../virtual_show_room/pages/plan_images.dart';
import '../virtual_show_room/pages/project_info/project_info.dart';


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
  List<String> planImagePaths;
  DateTime startDate;
  DateTime estimatedFinishDate;
  List<String> features;

  Project(
    {
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
      required this.planImagePaths,
      required this.startDate,
      required this.estimatedFinishDate,
      required this.features,
    }
  );

  static List<Project> projects = [
    Project(
      id: "0",
      companyLogoPath: "assets/id0/demirli_ins_logo.png",
      primaryColorValue: 0xff137CC0,
      companyPhone : "+902163300300",
      companyMail: "info@demirli.com.tr",
      companyAddress: "Yıldızbakkal Taşköprü Cad. Demirli İş Merkezi Kadıköy - İSTANBUL",
      companyLocationUrl: "https://goo.gl/maps/pUvD8P7sWb4NzitK7",
      enabledPageRoutes: [
        GeneralImagesPage.route,
        PlanImagesPage.route,
        ProjectInfoPage.route,
        ArPage.route,
      ],
      name: "Suadiye | Oran Apartmanı",
      locationUrl: "https://goo.gl/maps/HJdvb8UVM1TnqSx69",
      generalImagePaths: [
        "assets/id0/image_1.jpg",
        "assets/id0/image_2.jpg"
      ],
      planImagePaths: [
        "assets/id0/image_3.jpeg",
        "assets/id0/image_4.jpg",
        "assets/id0/image_5.jpg"
      ],
      startDate: DateTime(
        2022, 10, 7
      ),
      estimatedFinishDate: DateTime(
        2023, 12, 7
      ),
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