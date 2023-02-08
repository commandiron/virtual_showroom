import 'package:flutter/material.dart';

import '../../../../configs/app_padding.dart';

class ZoomInButton extends StatelessWidget {
  const ZoomInButton({this.onTap, Key? key}) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        alignment: Alignment.topRight,
        padding: AppPadding.allM,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: AppPadding.allS!,
            decoration: BoxDecoration(
              color: Theme.of(context)
                .colorScheme
                .primary
                .withOpacity(0.90),
              borderRadius: const BorderRadius.all(Radius.circular(32))
            ),
            child: Icon(
              Icons.zoom_in,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        )
      ),
    );
  }
}
