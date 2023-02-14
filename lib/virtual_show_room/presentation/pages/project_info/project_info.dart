import 'package:flutter/material.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/pages/project_info/responsive_project_info.dart';

import '../../../../core/presentation/responsive/responsive.dart';

class ProjectInfoPage extends StatelessWidget {
  const ProjectInfoPage(
    {
      required this.startDate,
      required this.estimatedFinishDate,
      required this.features,
      Key? key
    }
  ) : super(key: key);

  static const route = "project_info";

  final DateTime startDate;
  final DateTime estimatedFinishDate;
  final List<String> features;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: ResponsiveProjectInfoPage(
        startDate: startDate,
        estimatedFinishDate: estimatedFinishDate,
        features: features,
        listItemAspectRatio: 6,
      ),
      tablet: ResponsiveProjectInfoPage(
        startDate: startDate,
        estimatedFinishDate: estimatedFinishDate,
        features: features,
        listItemAspectRatio: 8,
      ),
      desktop: ResponsiveProjectInfoPage(
        startDate: startDate,
        estimatedFinishDate: estimatedFinishDate,
        features: features,
        listItemAspectRatio: 12,
      ),
    );
  }
}