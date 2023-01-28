import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import '../../provider/photo_view_scale_state_provider.dart';

class MyPhotoViewGallery extends StatefulWidget {
  const MyPhotoViewGallery({required this.imagePaths, Key? key}) : super(key: key);

  final List<String> imagePaths;

  @override
  State<MyPhotoViewGallery> createState() => _MyPhotoViewGalleryState();
}

class _MyPhotoViewGalleryState extends State<MyPhotoViewGallery> {
  @override
  Widget build(BuildContext context) {
    return PhotoViewGallery.builder(
      itemCount: widget.imagePaths.length,
      scaleStateChangedCallback: (value) {
        Provider.of<PhotoViewScaleStateProvider>(context, listen: false).setPhotoViewScaleState(value);
      },
      builder: (context, index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: AssetImage(widget.imagePaths[index]),
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
