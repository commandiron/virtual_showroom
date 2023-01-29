import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtual_showroom/configs/app_padding.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';
import 'package:virtual_showroom/model/page_item.dart';

class MyNavigationItem2 extends StatelessWidget {
  const MyNavigationItem2(
    {
      required this.pageItem,
      required this.enabled,
      required this.onPressed,
      Key? key
    }
  ) : super(key: key);

  final PageItem pageItem;
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
                ? Colors.white
                : Colors.black.withOpacity(0.75),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                color: enabled
                  ? Colors.white
                  : Colors.white,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              pageItem.title,
              style: AppTextStyle.b3?.copyWith(
                color: enabled
                  ? Colors.black
                  : Colors.white,
              ),
            )
          ),
        ),
      )
    );
  }
}