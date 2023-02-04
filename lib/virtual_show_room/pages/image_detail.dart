import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageDetailPage extends StatelessWidget {
  const ImageDetailPage({required this.imagePaths, required this.initialPage, required this.heroTag, Key? key}) : super(key: key);

  final List<String> imagePaths;
  final String heroTag;
  final int initialPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Hero(
        tag: heroTag,
        child: PhotoViewGallery.builder(
          itemCount: imagePaths.length,
          pageController: PageController(
              initialPage: imagePaths.length <= initialPage ? 0 : initialPage
          ),
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              initialScale: PhotoViewComputedScale.contained,
              minScale: PhotoViewComputedScale.contained,
              imageProvider: AssetImage(imagePaths[index]),
            );
          },
        ),
      )
    );
  }
}
