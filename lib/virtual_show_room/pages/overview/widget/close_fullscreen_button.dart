import 'package:flutter/material.dart';
import '../../../../configs/app_padding.dart';

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
              color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5)
          ),
          padding: AppPadding.allS!,
          child: IconButton(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              onPressed: onPressed,
              icon: const Icon(Icons.close_fullscreen)
          ),
        ),
      ),
    );
  }
}
