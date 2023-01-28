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
      gaplessPlayback: true,
      builder: (context, index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: AssetImage(Project.project1.generalViewImagePaths[index]),
          initialScale: PhotoViewComputedScale.contained * 1,
          minScale: PhotoViewComputedScale.contained * 1,
          maxScale: PhotoViewComputedScale.contained * 4,
          scaleStateCycle: (actual) {
            return myScaleStateCycle(actual);
          },
        );
      },
      backgroundDecoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      )
    );
  }
}

PhotoViewScaleState myScaleStateCycle(PhotoViewScaleState actual) {
  switch (actual) {
    case PhotoViewScaleState.initial:
      return PhotoViewScaleState.originalSize;
    case PhotoViewScaleState.originalSize:
      return PhotoViewScaleState.initial;
    case PhotoViewScaleState.zoomedIn:
    case PhotoViewScaleState.zoomedOut:
      return PhotoViewScaleState.initial;
    default:
      return PhotoViewScaleState.initial;
  }
}
