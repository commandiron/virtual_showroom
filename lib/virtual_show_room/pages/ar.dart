

import 'package:flutter/material.dart';
import 'package:virtual_showroom/configs/app_space.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';

class ArPage extends StatelessWidget {
  const ArPage({Key? key}) : super(key: key);

  static const route = "ar";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FractionallySizedBox(
          widthFactor: 0.75,
          child: Image.asset("assets/augmented_reality_soon_image.png")
        ),
        AppSpace.verticalL!,
        Text("Yakında Sizlerle..", style: AppTextStyle.h3b,),
        AppSpace.verticalXXL!,
        FractionallySizedBox(
          widthFactor: 0.25,
          child: Image.asset("assets/demirli_tech_text_logo_black.png")
        ),
      ],
    );
  }
}
