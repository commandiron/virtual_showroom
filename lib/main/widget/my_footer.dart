import 'package:flutter/material.dart';
import 'package:virtual_showroom/configs/app_padding.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: double.infinity,
      color: Theme.of(context).colorScheme.primaryContainer,
      padding: AppPadding.allXS,
      alignment: Alignment.center,
      child: FittedBox(
        child: Row(
          children: [
            Text(
              "from DEMIRLI",
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
    );
  }
}
