import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../configs/app_padding.dart';

class AppDotsIndicator extends StatelessWidget {
  const AppDotsIndicator({required this.dotsCount, required this.position, super.key});

  final int dotsCount;
  final double position;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.allS,
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: AppPadding.horizontalS!.add(AppPadding.verticalXS!),
        decoration: BoxDecoration(
          color: Theme.of(context)
            .colorScheme
            .secondaryContainer
            .withOpacity(0.90),
          borderRadius: const BorderRadius.all(Radius.circular(16))
        ),
        child: DotsIndicator(
          dotsCount: dotsCount,
          position: position,
          decorator: DotsDecorator(
            size: const Size.square(5.0),
            activeSize: const Size(18.0, 5.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
            ),
            activeColor: Theme.of(context).colorScheme.primary,
            color: Colors.white),
        ),
      ),
    );
  }
}
