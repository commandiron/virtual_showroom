import 'package:flutter/material.dart';
import '../widget/photo_view_gallery/my_photo_view_gallery.dart';

class PlanImagesPage extends StatelessWidget {
  const PlanImagesPage({required this.planImagePaths, Key? key}) : super(key: key);

  static const route = "plan_images";

  final List<String> planImagePaths;

  @override
  Widget build(BuildContext context) {
    return MyPhotoViewGallery(
      imagePaths: planImagePaths,
    );
  }
}
