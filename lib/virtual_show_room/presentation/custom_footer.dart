import 'package:flutter/material.dart';
import '../../core/presentation/config/app_padding.dart';
import '../../core/presentation/config/app_text_style.dart';
import '../../core/presentation/helper/url_launcher.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: double.infinity,
      color: Theme.of(context).colorScheme.secondaryContainer,
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
                  color: Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(0.3)
                ),
              ),
              Text(
                "DEMIRLI",
                style: AppTextStyle.b1?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer
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
