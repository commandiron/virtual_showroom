import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import '../../model/project.dart';

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
            heroAttributes: PhotoViewHeroAttributes(tag: Project.project1.generalViewImagePaths[index]),
          minScale: PhotoViewComputedScale.contained * 1,
          maxScale: PhotoViewComputedScale.contained * 4,
        );
      },
      backgroundDecoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      )
    );
  }
}
