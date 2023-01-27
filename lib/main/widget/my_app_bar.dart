import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';

import '../../configs/app_padding.dart';
import '../../model/project.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: AppPadding.horizontalM!.add(AppPadding.verticalS!),
              alignment: Alignment.centerLeft,
              child: Image.asset(Project.project1.companyImagePath),
            )
          ),
          Expanded(
            child: CupertinoButton(
              padding: AppPadding.allS,
              color: Theme.of(context).colorScheme.primary,
              onPressed: () {},
              child: FittedBox(
                child: Text(
                  "İletişim",
                  style: AppTextStyle.b2
                )
              )
            )
          ),
        ],
      )
    );
  }
}
