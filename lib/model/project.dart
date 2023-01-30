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
  List<String> generalImagePaths;
  List<String> planImagePaths;
  DateTime startDate;
  DateTime estimatedFinishDate;

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
      required this.generalImagePaths,
      required this.planImagePaths,
      required this.startDate,
      required this.estimatedFinishDate
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
      )
    ),
  ];
}