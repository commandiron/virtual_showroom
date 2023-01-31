import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:virtual_showroom/configs/app_padding.dart';
import 'package:virtual_showroom/configs/app_space.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';

import '../../model/project.dart';

class ProjectInfoPage extends StatelessWidget {
  const ProjectInfoPage(
    {
      required this.startDate,
      required this.estimatedFinishDate,
      required this.generalSpecs,
      required this.apartmentSpecs,
      Key? key
    }
  ) : super(key: key);

  static const route = "project_info";

  final DateTime startDate;
  final DateTime estimatedFinishDate;
  final List<Spec> generalSpecs;
  final List<Spec> apartmentSpecs;

  @override
  Widget build(BuildContext context) {

    final estimatedTotalDuration = estimatedFinishDate.difference(startDate).inDays;
    final passedTime = DateTime.now().difference(startDate).inDays;

    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              width: 200,
              child: CircleProgressBar(
                backgroundColor:  Theme.of(context).colorScheme.primaryContainer,
                foregroundColor: Theme.of(context).colorScheme.primary,
                animationDuration: Duration(milliseconds: 2000),
                value: passedTime / estimatedTotalDuration,
                strokeWidth: 16,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Tamamlanma Yüzdesi:",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.b2!,
                      ),
                      AnimatedCount(
                        count: (passedTime / estimatedTotalDuration) * 100,
                        fractionDigits: 0,
                        unit: '%',
                        duration: Duration(milliseconds: 2000),
                        curve: Curves.fastOutSlowIn,
                        style: AppTextStyle.b1!,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AppSpace.verticalL!,
            Text("Bitiş tarihi: ${DateFormat("MM/yyyy").format(estimatedFinishDate)}", style: AppTextStyle.b2!,),
            AppSpace.verticalL!,
            Text("Genel Özellikler", style: AppTextStyle.b2!,),
            AppSpace.verticalL!,
            InfoGridView(
              specs: generalSpecs
            ),
            AppSpace.verticalL!,
            Text("Daire Özellikleri", style: AppTextStyle.b2!,),
            InfoGridView(
              specs: apartmentSpecs
            ),
            SizedBox(
              height: 1000,
            ),

          ],
        ),
      ),
    );
  }
}

class InfoGridView extends StatelessWidget {
  const InfoGridView({required this.specs, Key? key}) : super(key: key);

  final List<Spec> specs;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: AppPadding.allS,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3
      ),
      itemCount: specs.length,
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: 1,
          child: Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(
              padding: AppPadding.allS!,
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          specs[index].category,
                          style: AppTextStyle.b2!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimaryContainer
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            specs[index].body,
                            style: AppTextStyle.h1b!.copyWith(
                              color: Theme.of(context).colorScheme.primary
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    )
                  ],
                ),
              )
            ),
          ),
        );
      },
    );
  }
}

