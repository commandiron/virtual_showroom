

import 'package:flutter/material.dart';
import 'package:virtual_showroom/configs/app_space.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';
import 'package:virtual_showroom/helper/url_launcher.dart';

class ArPage extends StatelessWidget {
  const ArPage({Key? key}) : super(key: key);

  static const route = "ar";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSpace.verticalExpanded!,
        FractionallySizedBox(
          widthFactor: 0.75,
          child: Image.asset("assets/augmented_reality_soon_image.jpg")
        ),
        AppSpace.verticalL!,
        Text("Yakında Sizlerle..", style: AppTextStyle.b1!),
        Expanded(
          child: FractionallySizedBox(
            widthFactor: 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("from", style: AppTextStyle.b1!.copyWith(
                    color: Colors.grey
                ),),
                AppSpace.verticalS!,
                InkWell(
                  onTap: () {
                    openURL("https://www.demirli.tech");
                  },
                  child: Image.asset(
                    "assets/demirli_tech_text_logo_black.png"
                  )
                ),
              ],
            )
          ),
        )
      ],
    );
  }
}
