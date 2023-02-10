import 'package:flutter/material.dart';

import '../../../../../core/presentation/config/app_padding.dart';

class CloseFullScreenButton extends StatelessWidget {
  const CloseFullScreenButton({this.onPressed, Key? key}) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: AppPadding.allM!,
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.9)
          ),
          padding: AppPadding.allS!,
          child: IconButton(
              color: Theme.of(context).colorScheme.onPrimary,
              onPressed: onPressed,
              icon: const Icon(Icons.close_fullscreen)
          ),
        ),
      ),
    );
  }
}
