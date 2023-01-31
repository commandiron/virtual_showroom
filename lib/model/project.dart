import '../virtual_show_room/pages/ar.dart';
import '../virtual_show_room/pages/general_images.dart';
import '../virtual_show_room/pages/plan_images.dart';
import '../virtual_show_room/pages/project_info.dart';


class Project {
  String id;
  String companyLogoPath;
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
      companyLogoPath: "assets/demirli_ins_logo.png",
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
        2023, 12, 7
      ),
      generalSpecs: [
        Spec(
          category: "Beton Sınıfı",
          body: "C40"
        ),
        Spec(
          category: "Zemin",
          body: "Kayalık"
        ),
        Spec(
          category: "Cephe",
          body: "Prekast"
        ),
        Spec(
          category: "Korkuluk",
          body: "Ferforje"
        ),
        Spec(
          category: "Jeneratör",
          body: "1'e 1"
        ),
        Spec(
          category: "Konum",
          body: "Özel"
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
        Spec(
          category: "Doğrama",
          body: "Rehau"
        ),
      ]
    ),
    Project(
        id: "1",
        companyLogoPath: "assets/demirli_ins_logo.png",
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
            2023, 12, 7
        ),
        generalSpecs: [
          Spec(
              category: "Beton Sınıfı",
              body: "C40"
          ),
          Spec(
              category: "Zemin",
              body: "Kayalık"
          ),
          Spec(
              category: "Cephe",
              body: "Prekast"
          ),
          Spec(
              category: "Korkuluk",
              body: "Ferforje"
          ),
          Spec(
              category: "Jeneratör",
              body: "1'e 1"
          ),
          Spec(
              category: "Konum",
              body: "Özel"
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
          Spec(
              category: "Doğrama",
              body: "Rehau"
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