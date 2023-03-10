import 'package:flutter/material.dart';

import '../../../../core/presentation/config/app_text_style.dart';
import '../../../../core/presentation/helper/url_launcher.dart';

class ContactItem extends StatelessWidget {
  const ContactItem(
    {
      required this.title,
      required this.body,
      required this.url,
      required this.icon,
      Key? key
    }
  ) : super(key: key);

  final String title;
  final String body;
  final String url;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: AppTextStyle.b1b!.copyWith(color: Colors.black),
          )
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                body,
                style: AppTextStyle.b2!.copyWith(color: Colors.black),
              )
            ),
            IconButton(
              onPressed: () { openURL(url); },
              icon: Icon(icon, color: Theme.of(context).colorScheme.primary,)
            )
          ],
        ),
      ],
    );
  }
}
