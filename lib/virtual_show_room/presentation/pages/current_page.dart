import 'package:flutter/material.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/pages/plans/plans.dart';
import '../../../core/domain/model/project.dart';
import '../../cubit/page/page_cubit.dart';
import 'ar/ar.dart';
import 'overview/overview.dart';
import 'project_info/project_info.dart';

class CurrentPage extends StatelessWidget {
  const CurrentPage({required this.pages, required this.project, required this.pageIndex, Key? key}) : super(key: key);

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
          generalImageUrls: project.projectImageUrls,
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
          generalImageUrls: project.projectImageUrls,
        );
    }
  }
}
