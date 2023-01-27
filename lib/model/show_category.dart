import 'package:flutter/cupertino.dart';
import 'package:virtual_showroom/main/pages/ar.dart';
import 'package:virtual_showroom/main/pages/general_view.dart';
import 'package:virtual_showroom/main/pages/information.dart';
import 'package:virtual_showroom/main/pages/plans.dart';

class ShowCategory {
  int pageIndex;
  String title;
  String logoImagePath;
  Widget view;

  ShowCategory(
    {
      required this.pageIndex,
      required this.title,
      required this.logoImagePath,
      required this.view
    }
  );

  static List<ShowCategory> showCategories = [
    ShowCategory(
      pageIndex: 0,
      title: "Görünüş",
      logoImagePath: "assets/facade.png",
      view: const GeneralView()
    ),
    ShowCategory(
      pageIndex: 1,
      title: "Planlar",
      logoImagePath: "assets/plan.png",
      view: const Plans()
    ),
    ShowCategory(
      pageIndex: 2,
      title: "Özellikler",
      logoImagePath: "assets/information.png",
      view: const Information()
    ),
    ShowCategory(
      pageIndex: 3,
      title: "AR",
      logoImagePath: "assets/ar.png",
      view: const Ar()
    ),
  ];
}