import 'package:flutter/material.dart';

import '../../../../core/configs/app_padding.dart';
import '../../../../core/configs/app_text_style.dart';
import 'contact_item.dart';


class AppDialog extends StatelessWidget {
  const AppDialog({required this.phone, required this.mail, required this.address, required this.locationUrl, Key? key}) : super(key: key);

  final String phone;
  final String mail;
  final String address;
  final String locationUrl;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.grey.shade50,
      title: Text("İletişim", style: AppTextStyle.h3!.copyWith(color: Colors.black),),
      contentPadding: AppPadding.horizontalL!.add(AppPadding.verticalM!),
      children: [
        ContactItem(
          title: "Telefon",
          body: phone,
          url: "tel:$phone",
          icon: Icons.phone
        ),
        ContactItem(
          title: "E posta",
          body: mail,
          url: "mailto:$mail",
          icon: Icons.mail
        ),
        ContactItem(
          title: "Ofis",
          body: address,
          url: locationUrl,
          icon: Icons.location_on
        ),
      ]
    );
  }
}
