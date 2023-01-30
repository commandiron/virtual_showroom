import '../virtual_show_room/pages/ar.dart';
import '../virtual_show_room/pages/general_images.dart';
import '../virtual_show_room/pages/plan_images.dart';
import '../virtual_show_room/pages/project_info.dart';

class PageItem {
  int index;
  String title;
  String route;
  bool enabled;

  PageItem(
    {
      required this.index,
      required this.title,
      required this.route,
      required this.enabled
    }
  );

  static List<PageItem> pages = [
    PageItem(
      index: 0,
      title: "Görünüş",
      route: GeneralImagesPage.route,
      enabled: true,
    ),
    PageItem(
      index: 1,
      title: "Planlar",
      route: PlanImagesPage.route,
      enabled: true,
    ),
    PageItem(
      index: 2,
      title: "Proje Bilgileri",
      route: ProjectInfoPage.route,
      enabled: true,
    ),
    PageItem(
      index: 3,
      title: "AR",
      route: ArPage.route,
      enabled: true,
    ),
  ];
}