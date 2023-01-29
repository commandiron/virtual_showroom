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
                : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                color: Colors.white,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              pageItem.title,
              textAlign: TextAlign.center,
              style: enabled
                ? AppTextStyle.b3b?.copyWith(
                  color: Colors.black
                )
                : AppTextStyle.b3?.copyWith(
                  color: Colors.white
                )
            )
          ),
        ),
      )
    );
  }
}