import 'package:virtual_showroom/virtual_show_room/presentation/pages/ar.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/pages/overview/overview.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/pages/plans/plans.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/pages/project_info/project_info.dart';

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
      route: OverviewPage.route,
      iconPath: "assets/general_images_icon.png"
    ),
    PageItem(
      index: 1,
      title: "Planlar",
      route: PlansPage.route,
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
      title: "Arttırılmış Gerçeklik",
      route: ArPage.route,
      iconPath: "assets/ar_icon.png"
    ),
  ];
}