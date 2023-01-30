import 'package:flutter/material.dart';

import '../virtual_show_room/pages/ar.dart';
import '../virtual_show_room/pages/general_images.dart';
import '../virtual_show_room/pages/plan_images.dart';
import '../virtual_show_room/pages/project_info.dart';

class PageItem {
  int index;
  String title;
  String neutralLogoImagePath;
  String highlightedLogoImagePath;
  Widget view;

  PageItem(
    {
      required this.index,
      required this.title,
      required this.neutralLogoImagePath,
      required this.highlightedLogoImagePath,
      required this.view
    }
  );

  static List<PageItem> pages = [
    PageItem(
      index: 0,
      title: "Görünüş",
      neutralLogoImagePath: "assets/neutral/facade_neutral.png",
      highlightedLogoImagePath : "assets/highlighted/facade_highlighted.png",
      view: const GeneralImagesPage()
    ),
    PageItem(
      index: 1,
      title: "Planlar",
      neutralLogoImagePath: "assets/neutral/plan_neutral.png",
      highlightedLogoImagePath :  "assets/highlighted/plan_highlighted.png",
      view: const PlanImagesPage()
    ),
    PageItem(
      index: 2,
      title: "Proje Bilgileri",
      neutralLogoImagePath: "assets/neutral/information_neutral.png",
      highlightedLogoImagePath : "assets/highlighted/information_highlighted.png",
      view: const ProjectInfoPage()
    ),
    PageItem(
      index: 3,
      title: "AR",
      neutralLogoImagePath: "assets/neutral/ar_neutral.png",
      highlightedLogoImagePath :  "assets/highlighted/ar_hightlighted.png",
      view: const ArPage()
    ),
  ];
}