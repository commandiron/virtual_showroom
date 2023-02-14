import 'package:flutter/material.dart';
import '../../../../core/presentation/config/app_space.dart';
import '../../../../core/presentation/config/app_text_style.dart';
import '../../../../core/presentation/helper/url_launcher.dart';


class ResponsiveArPage extends StatelessWidget {
  const ResponsiveArPage({required this.imageWidthFactor, Key? key}) : super(key: key);

  final double imageWidthFactor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSpace.verticalExpanded!,
        FractionallySizedBox(
          widthFactor: imageWidthFactor,
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
        )
      ],
    );
  }
}
