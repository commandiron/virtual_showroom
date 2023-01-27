import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../../configs/app_padding.dart';

class ProjectInfo extends StatelessWidget {
  const ProjectInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Tamamlanma tarihi: 10/2023"),
        Padding(
          padding: AppPadding.allM!,
          child: SimpleCircularProgressBar(
            valueNotifier: ValueNotifier(12),
            size: 52,
            backStrokeWidth: 3,
            backColor: Theme.of(context).colorScheme.onPrimary,
            progressStrokeWidth: 3,
            progressColors: [
              Theme.of(context).colorScheme.primary
            ],
            mergeMode: true,
            onGetText: (double value) {
              return Text('${value.toInt()}%');
            },
          ),
        ),
        Text("C-40 Beton - Kayalık Zemin"),
        Text("Prekast cephe"),
        Text("Akıllı Ev"),
        Text("Daireye ait 2 araçlık otopark yeri "),
        Text("Deniz Manzarası"),
        Text("Merkezi Sistem yerden ısıtma"),
        Text("Her bölgeye enerji sağlanayan jeneratör"),
      ],
    );
  }
}
