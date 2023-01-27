import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';
import 'package:virtual_showroom/helper/url_launcher.dart';
import 'package:virtual_showroom/model/company_contact.dart';

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
                      return SimpleDialog(
                        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                        title: Text("İletişim", style: AppTextStyle.h3!.copyWith(color: Colors.black),),
                        contentPadding: AppPadding.horizontalL!.add(AppPadding.verticalM!),
                        children: CompanyContact.items.map(
                          (item) => Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  item.title,
                                  style: AppTextStyle.b1b!.copyWith(color: Colors.black),
                                )
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      item.body,
                                      style: AppTextStyle.b2!.copyWith(color: Colors.black),
                                    )
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      openURL(item.url);
                                    },
                                    icon: Icon(item.icon, color: Theme.of(context).colorScheme.primary,)
                                  )
                                ],
                              ),
                            ],
                          )
                        ).toList()
                      );
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
