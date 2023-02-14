import 'package:flutter/material.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/app_bar/responsive_custom_app_bar.dart';

import '../../../core/domain/model/project.dart';
import '../../../core/presentation/responsive/responsive.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({required this.project, Key? key}) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: ResponsiveCustomAppBar(
        project: project,
        logoFlex: 2,
      ),
      tablet: ResponsiveCustomAppBar(
        project: project,
        logoFlex: 3,
      ),
      desktop: ResponsiveCustomAppBar(
        project: project,
        logoFlex: 3,
      ),
    );
  }
}