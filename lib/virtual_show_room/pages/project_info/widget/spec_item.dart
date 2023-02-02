import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:virtual_showroom/model/project.dart';

import '../../../../configs/app_padding.dart';
import '../../../../configs/app_text_style.dart';

class SpecItem extends StatelessWidget {
  const SpecItem({required this.spec, Key? key}) : super(key: key);

  final Spec spec;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16)
        )
      ),
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: AppPadding.allS!,
        child: Center(
          child: Column(
            children: [
              Center(
                child: Text(
                  spec.category,
                  style: AppTextStyle.b2!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Center(
                  child: AutoSizeText(
                    spec.body,
                    style: AppTextStyle.h3b!.copyWith(
                      color: Theme.of(context).colorScheme.primary
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                )
              )
            ],
          ),
        )
      ),
    );
  }
}
