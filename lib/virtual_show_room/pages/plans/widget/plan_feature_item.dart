import 'package:flutter/material.dart';
import '../../../../configs/app_space.dart';
import '../../../../configs/app_text_style.dart';

class PlanFeatureItem extends StatelessWidget {
  const PlanFeatureItem(
      {
        required this.icon,
        required this.title,
        required this.body,
        Key? key
      }
      ) : super(key: key);

  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withAlpha(20),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(12)
                  )
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          AppSpace.horizontalL!,
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.b2!.copyWith(color: Colors.grey)
                ),
                AppSpace.verticalS!,
                Text(
                  body,
                  style: AppTextStyle.b1!.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer),
                ),
              ],
            ),
          ),
        ]
      )
    );
  }
}