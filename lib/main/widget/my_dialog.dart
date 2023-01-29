import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../configs/app_padding.dart';
import '../../configs/app_text_style.dart';
import '../../helper/url_launcher.dart';
import '../../model/company_contact.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.grey.shade50,
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
                    if(defaultTargetPlatform == TargetPlatform.iOS) {
                      openURL(item.iosUrl);
                    } else {
                      openURL(item.androidUrl);
                    }
                  },
                  icon: Icon(item.icon, color: Theme.of(context).colorScheme.primary,)
                )
              ],
            ),
          ],
        )
      ).toList()
    );
  }
}
