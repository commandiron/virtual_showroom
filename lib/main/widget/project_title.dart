import 'package:flutter/material.dart';
import '../../configs/app_text_style.dart';
import '../../model/project.dart';

class ProjectTitle extends StatelessWidget {
  const ProjectTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      alignment: Alignment.center,
      child: FittedBox(
        child: Text(
          Project.project1.name,
          style: AppTextStyle.h3
        ),
      )
    );
  }
}
