import 'package:flutter/material.dart';
import 'package:virtual_showroom/configs/app_padding.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({required this.feature, Key? key}) : super(key: key);

  final String feature;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16)
        )
      ),
      color: Colors.grey.shade50,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            padding: AppPadding.horizontalS,
            child: Text(
              feature,
              textAlign: TextAlign.center,
              style: AppTextStyle.b1b!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer
              )
            ),
          ),
          Container(
            padding: AppPadding.allS!,
            alignment: Alignment.topRight,
            child: Icon(
              Icons.check,
              size: 16,
              color: Theme.of(context).colorScheme.primary,
            )
          )
        ],
      )
    );
  }
}
