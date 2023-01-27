import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:virtual_showroom/configs/app_space.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';
import '../../model/project.dart';

class ProjectInfo extends StatelessWidget {
  const ProjectInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final estimatedTotalDuration = Project.project1.estimatedFinishDate.difference(Project.project1.startDate).inDays;
    final passedTime = DateTime.now().difference(Project.project1.startDate).inDays;

    return Column(
      children: [
        const Text("Tamamlanma tarihi: 10/2023"),
        AppSpace.verticalL!,
        SizedBox(
          width: 128,
          child: CircleProgressBar(
            backgroundColor:  Theme.of(context).colorScheme.onBackground.withOpacity(0.35),
            foregroundColor: Theme.of(context).colorScheme.primary,
            animationDuration: Duration(milliseconds: 2000),
            value: passedTime / estimatedTotalDuration,
            child: Center(
              child: AnimatedCount(
                count: (passedTime / estimatedTotalDuration) * 100,
                fractionDigits: 0,
                unit: '%',
                duration: Duration(milliseconds: 2000),
                curve: Curves.fastOutSlowIn,
                style: AppTextStyle.b1!,
              ),
            ),
          ),
        ),
        AppSpace.verticalL!,
        Text("Proje Bilgileri", style: AppTextStyle.b1!,),
      ],
    );
  }
}
