import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import '../../model/project.dart';
import '../widget/carousel_item.dart';

class GeneralView extends StatelessWidget {
  const GeneralView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhotoViewGallery.builder(
      itemCount: Project.project1.generalViewImagePaths.length,
      builder: (context, index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: AssetImage(Project.project1.generalViewImagePaths[index]),
          initialScale: PhotoViewComputedScale.contained * 1,
            heroAttributes: PhotoViewHeroAttributes(tag: Project.project1.generalViewImagePaths[index])
        );
      },
    );

    CarouselSlider.builder(
      itemCount: Project.project1.generalViewImagePaths.length,
      itemBuilder: (context, index, realIndex) {
        return CarouselItem(
          imagePath: Project.project1.generalViewImagePaths[index],
          color: Theme.of(context).colorScheme.onBackground,
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
