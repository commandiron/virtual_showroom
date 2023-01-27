import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtual_showroom/configs/app_space.dart';
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
                        children: [
                          Text("Telefon", style: AppTextStyle.b1b!.copyWith(color: Colors.black),),
                          Row(
                            children: [
                              Text(CompanyContact.item.phoneNumber, style: AppTextStyle.b2!.copyWith(color: Colors.black),),
                              IconButton(
                                onPressed: () {
                                  openURL("tel:${CompanyContact.item.phoneNumber}");
                                },
                                icon: Icon(
                                  Icons.phone,
                                  color: Theme.of(context).colorScheme.primary
                                )
                              )
                            ],
                          ),
                          AppSpace.verticalS!,
                          Text("E posta", style: AppTextStyle.b1b!.copyWith(color: Colors.black),),
                          Row(
                            children: [
                              Text(CompanyContact.item.email, style: AppTextStyle.b2!.copyWith(color: Colors.black),),
                              IconButton(
                                  onPressed: () {
                                    openURL("mailto:${CompanyContact.item.email}");
                                  },
                                  icon: Icon(
                                    Icons.mail,
                                    color: Theme.of(context).colorScheme.primary
                                  )
                              )
                            ],
                          ),
                          AppSpace.verticalS!,
                          Text("Ofis", style: AppTextStyle.b1b!.copyWith(color: Colors.black),),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Text(
                                  CompanyContact.item.address,
                                  style: AppTextStyle.b2!.copyWith(color: Colors.black),
                                )
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {
                                    openURL("https://goo.gl/maps/RNiqv558Wzu3nqeR7");
                                  },
                                  icon: Icon(
                                    Icons.location_on,
                                    color: Theme.of(context).colorScheme.primary
                                  )
                                ),
                              )
                            ],
                          ),
                        ],
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
