import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtual_showroom/configs/app_padding.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';

class MyNavigationItem extends StatelessWidget {
  const MyNavigationItem(
    {
      required this.title,
      required this.enabled,
      required this.onPressed,
      Key? key
    }
  ) : super(key: key);

  final String title;
  final bool enabled;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: AppPadding.horizontalXS!,
        child: InkWell(
          onTap: () {
            onPressed();
          },
          borderRadius:BorderRadius.circular(8),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: enabled
                ? Theme.of(context).colorScheme.primaryContainer
                : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyle.b3?.copyWith(
                color: enabled
                  ? Theme.of(context).colorScheme.onPrimaryContainer
                  : Theme.of(context).colorScheme.onBackground
              )
            )
          ),
        ),
      )
    );
  }
}