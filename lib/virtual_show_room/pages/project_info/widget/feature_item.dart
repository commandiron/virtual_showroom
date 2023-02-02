import 'package:flutter/material.dart';
import '../../../../configs/app_padding.dart';
import '../../../../configs/app_text_style.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({required this.feature, Key? key}) : super(key: key);

  final String feature;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: AppPadding.horizontalM,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16)
          )
        ),
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Padding(
          padding: AppPadding.horizontalM!,
          child: Center(
            child: Text(
              feature,
              style: AppTextStyle.b1b?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer
              ),
            ),
          )
        )
      ),
    );
  }
}
