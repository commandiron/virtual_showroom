import 'package:flutter/material.dart';
import 'package:virtual_showroom/configs/app_padding.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({required this.feature, Key? key}) : super(key: key);

  final String feature;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(16)
        ),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primaryContainer
        )
      ),
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            padding: AppPadding.horizontalS,
            child: Text(
              feature,
              textAlign: TextAlign.center,
              style: AppTextStyle.b1b!.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer
              )
            ),
          ),
          Container(
            padding: AppPadding.allS!,
            alignment: Alignment.topRight,
            child: Icon(
              Icons.check_circle,
              size: 16,
              color: Theme.of(context).colorScheme.primary,
            )
          )
        ],
      )
    );
  }
}
