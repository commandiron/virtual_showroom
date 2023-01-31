import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:virtual_showroom/virtual_show_room/widget/dialog/contact_item.dart';
import '../../../configs/app_padding.dart';
import '../../../configs/app_text_style.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({required this.phone, required this.mail, required this.address, required this.locationUrl, Key? key}) : super(key: key);

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
