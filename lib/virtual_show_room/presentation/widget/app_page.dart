import 'package:flutter/material.dart';
import '../../../core/model/project.dart';
import '../page_item.dart';
import '../pages/ar.dart';
import '../pages/overview/overview.dart';
import '../pages/plans/plans.dart';
import '../pages/project_info/project_info.dart';

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
      case OverviewPage.route :
        return OverviewPage(
          generalImagePaths: project.generalImagePaths,
        );
      case PlansPage.route :
        return PlansPage(
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
        return OverviewPage(
          generalImagePaths: project.generalImagePaths,
        );
    }
  }
}