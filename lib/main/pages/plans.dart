import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../model/project.dart';
import '../widget/carousel_item.dart';

class Plans extends StatelessWidget {
  const Plans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: Project.project1.planImagePaths.length,
      itemBuilder: (context, index, realIndex) {
        return CarouselItem(
          imageUrl: Project.project1.planImagePaths[index],
          color: Theme.of(context).colorScheme.background,
          fit: BoxFit.fitWidth,
        );
      },
      options: CarouselOptions(
          height: MediaQuery.of(context).size.height / 1.6,
          viewportFraction: 0.9
      )
    );
  }
}
