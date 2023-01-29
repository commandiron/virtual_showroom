import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtual_showroom/configs/app_padding.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';
import 'package:virtual_showroom/model/page_item.dart';

class MyNavigationItem extends StatelessWidget {
  const MyNavigationItem(
    {
      required this.pageItem,
      required this.enabled,
      this.onPressed,
      Key? key
    }
  ) : super(key: key);

  final PageItem pageItem;
  final bool enabled;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: AppPadding.allS!,
          child: CupertinoButton(
            padding: AppPadding.zero,
            color: enabled
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.primaryContainer,
            onPressed: onPressed,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: AppPadding.allS!.add(EdgeInsets.only(top: 4)),
                    child: Image.asset(
                      enabled
                        ? pageItem.highlightedLogoImagePath
                        : pageItem.neutralLogoImagePath,
                    ),
                  )
                ),
                Container(
                  height: 30,
                  padding: AppPadding.horizontalS!,
                  alignment: Alignment.topCenter,
                  child: FittedBox(
                    child: Text(
                      pageItem.title,
                      style: AppTextStyle.b2?.copyWith(
                        color: enabled
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}