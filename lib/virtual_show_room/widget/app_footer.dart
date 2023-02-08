import 'package:flutter/material.dart';
import 'package:virtual_showroom/configs/app_padding.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';
import 'package:virtual_showroom/helper/url_launcher.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: double.infinity,
      color: Theme.of(context).colorScheme.primaryContainer,
      padding: AppPadding.allXS,
      alignment: Alignment.center,
      child: FittedBox(
        child: InkWell(
          onTap: () {
            openURL("https://www.demirli.tech");
          },
          child: Row(
            children: [
              Text(
                "from ",
                style: AppTextStyle.b1?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.3)
                ),
              ),
              Text(
                "DEMIRLI",
                style: AppTextStyle.b1?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer
                ),
              ),
              Text(
                "tech",
                style: AppTextStyle.b1?.copyWith(
                  color: Color(0xffF48B0B)
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
