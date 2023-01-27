import 'package:flutter/cupertino.dart';
import 'package:virtual_showroom/main/pages/ar.dart';
import 'package:virtual_showroom/main/pages/general_view.dart';
import 'package:virtual_showroom/main/pages/information.dart';
import 'package:virtual_showroom/main/pages/plans.dart';

class ShowCategory {
  int pageIndex;
  String title;
  String neutralLogoImagePath;
  String highlightedLogoImagePath;
  Widget view;

  ShowCategory(
    {
      required this.pageIndex,
      required this.title,
      required this.neutralLogoImagePath,
      required this.highlightedLogoImagePath,
      required this.view
    }
  );

  static List<ShowCategory> showCategories = [
    ShowCategory(
      pageIndex: 0,
      title: "Görünüş",
      neutralLogoImagePath: "assets/neutral/facade_neutral.png",
      highlightedLogoImagePath : "assets/highlighted/facade_highlighted.png",
      view: const GeneralView()
    ),
    ShowCategory(
      pageIndex: 1,
      title: "Planlar",
      neutralLogoImagePath: "assets/neutral/plan_neutral.png",
      highlightedLogoImagePath :  "assets/highlighted/plan_highlighted.png",
      view: const Plans()
    ),
    ShowCategory(
      pageIndex: 2,
      title: "Özellikler",
      neutralLogoImagePath: "assets/neutral/information_neutral.png",
      highlightedLogoImagePath : "assets/highlighted/information_highlighted.png",
      view: const Information()
    ),
    ShowCategory(
      pageIndex: 3,
      title: "AR",
      neutralLogoImagePath: "assets/neutral/ar_neutral.png",
      highlightedLogoImagePath :  "assets/highlighted/ar_hightlighted.png",
      view: const Ar()
    ),
  ];
}