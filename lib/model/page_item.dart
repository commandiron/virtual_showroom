import '../virtual_show_room/pages/ar.dart';
import '../virtual_show_room/pages/general_images.dart';
import '../virtual_show_room/pages/plan_images.dart';
import '../virtual_show_room/pages/project_info/project_info.dart';

class PageItem {
  int index;
  String title;
  String route;
  String iconPath;

  PageItem(
    {
      required this.index,
      required this.title,
      required this.route,
      required this.iconPath,
    }
  );

  static List<PageItem> pages = [
    PageItem(
      index: 0,
      title: "Görünüş",
      route: GeneralImagesPage.route,
      iconPath: "assets/general_images_icon.png"
    ),
    PageItem(
      index: 1,
      title: "Planlar",
      route: PlanImagesPage.route,
      iconPath: "assets/plan_images_icon.png"
    ),
    PageItem(
      index: 2,
      title: "Proje Bilgileri",
      route: ProjectInfoPage.route,
      iconPath: "assets/project_info_icon.png"
    ),
    PageItem(
      index: 3,
      title: "Augmented Reality",
      route: ArPage.route,
      iconPath: "assets/ar_icon.png"
    ),
  ];
}