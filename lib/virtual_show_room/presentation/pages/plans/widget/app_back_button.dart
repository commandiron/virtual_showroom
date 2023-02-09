import 'package:flutter/material.dart';
import '../../../../../core/configs/app_padding.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({this.onPressed, Key? key}) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.allS!,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context)
            .colorScheme
            .primary
            .withOpacity(0.90),
          borderRadius: const BorderRadius.all(Radius.circular(36))),
        child: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Theme.of(context).colorScheme.onPrimary,
          onPressed: onPressed
        ),
      ),
    );
  }
}
