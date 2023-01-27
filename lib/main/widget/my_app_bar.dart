import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';
import 'package:virtual_showroom/main/widget/my_dialog.dart';

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
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: CupertinoButton(
                padding: AppPadding.zero,
                color: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const MyDialog();
                    },
                  );
                },
                child: FittedBox(
                  child: Text(
                    "İletişim",
                    style: AppTextStyle.b2
                  )
                )
              ),
            )
          ),
        ],
      )
    );
  }
}
