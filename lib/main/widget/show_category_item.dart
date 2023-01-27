import 'package:flutter/material.dart';
import 'package:virtual_showroom/configs/app_padding.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';
import 'package:virtual_showroom/model/show_category.dart';

class ShowCategoryItem extends StatelessWidget {
  const ShowCategoryItem({required this.showCategory, required this.enabled, this.onPressed, Key? key}) : super(key: key);

  final ShowCategory showCategory;
  final bool enabled;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: AppPadding.allXS!,
          child: ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              backgroundColor: enabled
                ? MaterialStateProperty.all(Theme.of(context).colorScheme.primary)
                : MaterialStateProperty.all(Theme.of(context).colorScheme.primaryContainer)
            ),
            onPressed: onPressed,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: AppPadding.allS!.add(EdgeInsets.only(top: 4)),
                    child: Image.asset(
                      showCategory.logoImagePath,
                    ),
                  )
                ),
                Container(
                  height: 30,
                  padding: AppPadding.horizontalS!,
                  alignment: Alignment.topCenter,
                  child: FittedBox(
                    child: Text(
                      showCategory.title,
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