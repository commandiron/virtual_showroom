import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';

import '../../../../configs/app_padding.dart';
import '../../../../configs/app_text_style.dart';

class ProgressView extends StatelessWidget {
  const ProgressView({required this.startDate, required this.estimatedFinishDate, Key? key}) : super(key: key);

  final DateTime startDate;
  final DateTime estimatedFinishDate;

  @override
  Widget build(BuildContext context) {

    final estimatedTotalDuration = estimatedFinishDate.difference(startDate).inDays;
    final passedTime = DateTime.now().difference(startDate).inDays;

    return SizedBox(
      width: 200,
      child: CircleProgressBar(
        backgroundColor:  Theme.of(context).colorScheme.primaryContainer,
        foregroundColor: Theme.of(context).colorScheme.primary,
        animationDuration: const Duration(milliseconds: 2000),
        value: passedTime / estimatedTotalDuration,
        strokeWidth: 16,
        child: Container(
          alignment: Alignment.center,
          padding: AppPadding.allM,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "İnşaat Tamamlanma Yüzdesi:",
                textAlign: TextAlign.center,
                style: AppTextStyle.b2!,
              ),
              AnimatedCount(
                count: (passedTime / estimatedTotalDuration) * 100,
                fractionDigits: 0,
                unit: '%',
                duration: const Duration(milliseconds: 2000),
                curve: Curves.fastOutSlowIn,
                style: AppTextStyle.b1b!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
