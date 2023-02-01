import '../virtual_show_room/pages/ar.dart';
import '../virtual_show_room/pages/general_images.dart';
import '../virtual_show_room/pages/plan_images.dart';
import '../virtual_show_room/pages/project_info.dart';


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
  List<Spec> generalSpecs;
  List<Spec>  apartmentSpecs;

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
      required this.generalSpecs,
      required this.apartmentSpecs
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
      generalSpecs: [
        Spec(
          category: "Beton",
          body: "C40"
        ),
        Spec(
          category: "Zemin",
          body: "Kayalık"
        ),
        Spec(
          category: "Akıllı Ev",
          body: "Viko"
        ),
        Spec(
          category: "Manzara",
          body: "Deniz"
        ),
        Spec(
          category: "Konum",
          body: "Önü Kapanmaz"
        ),
        Spec(
          category: "Daire Otopark",
          body: "2 Adet + Misafir"
        ),
        Spec(
          category: "Cephe",
          body: "Prekast"
        ),
        Spec(
          category: "Jeneratör",
          body: "Tam Besleme"
        ),
        Spec(
          category: "Duvar",
          body: "Ytong"
        ),
        Spec(
          category: "Çatı",
          body: "Braas"
        ),
        Spec(
          category: "Bina Girişi",
          body: "Lobi"
        ),
        Spec(
          category: "Diafon",
          body: "Görüntülü"
        ),
        Spec(
          category: "Akıllı Ev",
          body: "Kamera Sistemi"
        ),
        Spec(
          category: "Akıllı Ev",
          body: "Gaz Kaçağı Güvenliği"
        ),
        Spec(
          category: "Akıllı Ev",
          body: "Su Baskını Güvenliği"
        ),
        Spec(
          category: "Akıllı Ev",
          body: "Yangın Güvenliği"
        ),
        Spec(
          category: "Akıllı Ev",
          body: "Aydınlatma Kontrolü"
        ),
        Spec(
          category: "Akıllı Ev",
          body: "Panjur Kontrolü"
        ),
        Spec(
          category: "Akıllı Ev",
          body: "Zip Perde Kontrolü"
        ),
        Spec(
          category: "Korkuluk",
          body: "Ferforje"
        ),
        Spec(
            category: "Isıtma",
            body: "Yerden"
        ),
        Spec(
            category: "Parke",
            body: "Lamine"
        ),
        Spec(
            category: "Balkon",
            body: "Giyotin"
        ),
      ],
      apartmentSpecs: [
        Spec(
          category: "Teknoloji",
          body: "Akıllı Ev"
        ),
        Spec(
          category: "Manzara",
          body: "Deniz"
        ),
        Spec(
          category: "Daire Otopark",
          body: "2"
        ),
        Spec(
          category: "Isıtma",
          body: "Yerden"
        ),
        Spec(
          category: "Parke",
          body: "Lamine"
        ),
        Spec(
          category: "Balkon",
          body: "Giyotin"
        ),
      ]
    ),
  ];
}


class Spec {
  String category;
  String body;

  Spec(
    {
      required this.category,
      required this.body,
    }
  );
}