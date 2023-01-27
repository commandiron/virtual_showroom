import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../model/project.dart';
import '../widget/carousel_item.dart';

class GeneralView extends StatelessWidget {
  const GeneralView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: Project.project1.generalViewImagePaths.length,
      itemBuilder: (context, index, realIndex) {
        return CarouselItem(
          imageUrl: Project.project1.generalViewImagePaths[index],
          color: Theme.of(context).colorScheme.primaryContainer,
          fit: BoxFit.cover,
        );
      },
      options: CarouselOptions(
        enlargeCenterPage: true,
          height: MediaQuery.of(context).size.height / 1.6,
      )
    );
  }
}
