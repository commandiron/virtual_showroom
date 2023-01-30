import 'package:flutter/material.dart';
import '../../configs/app_text_style.dart';

class ProjectTitle extends StatelessWidget {
  const ProjectTitle({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      alignment: Alignment.center,
      child: FittedBox(
        child: Text(
          title,
          style: AppTextStyle.h3
        ),
      )
    );
  }
}
