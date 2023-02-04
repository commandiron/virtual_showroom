import 'package:flutter/material.dart';
import 'package:virtual_showroom/virtual_show_room/pages/plan_images.dart';
import 'package:virtual_showroom/virtual_show_room/pages/project_info/project_info.dart';
import '../../model/page_item.dart';
import '../../model/project.dart';
import '../pages/ar.dart';
import '../pages/general_images.dart';

class AppPage extends StatelessWidget {
  const AppPage({required this.pages, required this.project, required this.pageIndex, Key? key}) : super(key: key);

  final List<PageItem> pages;
  final Project project;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedSwitcher(
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        duration: const Duration(milliseconds: 600),
        child: getPage()
      ),
    );
  }

  Widget getPage() {
    switch(pages.firstWhere((page) => page.index == pageIndex).route) {
      case GeneralImagesPage.route :
        return GeneralImagesPage(
          generalImagePaths: project.generalImagePaths,
        );
      case PlanImagesPage.route :
        return PlanImagesPage(
          apartments: project.apartments,
        );
      case ProjectInfoPage.route:
        return ProjectInfoPage(
          startDate: project.startDate,
          estimatedFinishDate: project.estimatedFinishDate,
          features: project.features,
        );
      case ArPage.route :
        return const ArPage();
      default:
        return GeneralImagesPage(
          generalImagePaths: project.generalImagePaths,
        );
    }
  }
}
