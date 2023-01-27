import 'package:flutter/cupertino.dart';
import 'package:virtual_showroom/main/pages/ar.dart';
import 'package:virtual_showroom/main/pages/general_view.dart';
import 'package:virtual_showroom/main/pages/project_info.dart';
import 'package:virtual_showroom/main/pages/plans.dart';

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
      view: const GeneralView()
    ),
    PageItem(
      index: 1,
      title: "Planlar",
      neutralLogoImagePath: "assets/neutral/plan_neutral.png",
      highlightedLogoImagePath :  "assets/highlighted/plan_highlighted.png",
      view: const Plans()
    ),
    PageItem(
      index: 2,
      title: "Proje Bilgileri",
      neutralLogoImagePath: "assets/neutral/information_neutral.png",
      highlightedLogoImagePath : "assets/highlighted/information_highlighted.png",
      view: const ProjectInfo()
    ),
    PageItem(
      index: 3,
      title: "AR",
      neutralLogoImagePath: "assets/neutral/ar_neutral.png",
      highlightedLogoImagePath :  "assets/highlighted/ar_hightlighted.png",
      view: const Ar()
    ),
  ];
}