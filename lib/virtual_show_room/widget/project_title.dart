import 'package:flutter/material.dart';
import '../../configs/app_text_style.dart';
import '../../helper/url_launcher.dart';

class ProjectTitle extends StatelessWidget {
  const ProjectTitle({required this.title, required this.locationUrl, Key? key}) : super(key: key);

  final String title;
  final String locationUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      alignment: Alignment.center,
      child: FittedBox(
        child: Row(
          children: [
            const SizedBox(
              width: 24,
            ),
            Text(
              title,
              style: AppTextStyle.h3
            ),
            InkWell(
              onTap: () {
                openURL(locationUrl);
              },
              child: Icon(
                Icons.location_on,
                color: Theme.of(context).colorScheme.primary,
                size: 24,
              )
            ),
          ],
        ),
      )
    );
  }
}
