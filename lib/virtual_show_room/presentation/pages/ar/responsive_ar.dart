import 'package:flutter/material.dart';
import 'package:virtual_showroom/core/presentation/config/app_padding.dart';
import '../../../../core/presentation/config/app_space.dart';
import '../../../../core/presentation/config/app_text_style.dart';
import '../../../../core/presentation/helper/url_launcher.dart';


class ResponsiveArPage extends StatelessWidget {
  const ResponsiveArPage({required this.imageWidthFactor, required this.logoWidthFactor, Key? key}) : super(key: key);

  final double imageWidthFactor;
  final double logoWidthFactor;

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: AppPadding.verticalL,
        child: Column(
          children: [
            AppSpace.verticalXL!,
            FractionallySizedBox(
              widthFactor: imageWidthFactor,
              child: Image.asset("assets/augmented_reality_soon_image.jpg")
            ),
            AppSpace.verticalXL!,
            Text("Yakında Sizlerle..", style: AppTextStyle.b1!),
            AppSpace.verticalXL!,
            FractionallySizedBox(
              widthFactor: logoWidthFactor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "from",
                    style: AppTextStyle.b3!.copyWith(
                      color: Colors.grey
                    ),
                  ),
                  AppSpace.verticalS!,
                  InkWell(
                    onTap: () {
                      openURL("https://www.demirli.tech");
                    },
                    child: Image.asset(
                      Theme.of(context).brightness == Brightness.light
                        ? "assets/demirli_tech_text_logo_black.png"
                        : "assets/demirli_tech_text_logo_white.png"
                    )
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
