import '../virtual_show_room/pages/ar.dart';
import '../virtual_show_room/pages/general_images.dart';
import '../virtual_show_room/pages/plan_images.dart';
import '../virtual_show_room/pages/project_info/project_info.dart';

class PageItem {
  int index;
  String title;
  String route;

  PageItem(
    {
      required this.index,
      required this.title,
      required this.route
    }
  );

  static List<PageItem> pages = [
    PageItem(
      index: 0,
      title: "Görünüş",
      route: GeneralImagesPage.route,
    ),
    PageItem(
      index: 1,
      title: "Planlar",
      route: PlanImagesPage.route,
    ),
    PageItem(
      index: 2,
      title: "Proje Bilgileri",
      route: ProjectInfoPage.route,
    ),
    PageItem(
      index: 3,
      title: "Augmented Reality",
      route: ArPage.route,
    ),
  ];
}