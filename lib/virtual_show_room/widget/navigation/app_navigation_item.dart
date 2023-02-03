import 'package:flutter/material.dart';
import 'package:virtual_showroom/configs/app_padding.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';

class AppNavigationItem extends StatelessWidget {
  const AppNavigationItem(
    {
      required this.title,
      required this.iconPath,
      required this.enabled,
      required this.onPressed,
      Key? key
    }
  ) : super(key: key);

  final String title;
  final String iconPath;
  final bool enabled;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.allXS!,
      child: InkWell(
        onTap: () {
          onPressed();
        },
        borderRadius:BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            color: enabled
              ? Theme.of(context).colorScheme.primaryContainer
              : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
          ),
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.b2b?.copyWith(
                    color: enabled
                      ? Theme.of(context).colorScheme.onPrimaryContainer
                      : Theme.of(context).colorScheme.onBackground
                  )
                ),
              ),
              Expanded(
                child: Padding(
                  padding: AppPadding.allS!,
                  child: enabled
                    ? Image.asset(
                        iconPath,
                    )
                    : Image.asset(
                      iconPath,
                      colorBlendMode: BlendMode.srcATop,
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.1)
                    )
                )
              )
            ],
          )
        ),
      ),
    );
  }
}