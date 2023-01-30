import 'package:flutter/material.dart';
import '../../model/project.dart';
import '../widget/my_photo_view_gallery.dart';

class PlanImagesPage extends StatelessWidget {
  const PlanImagesPage({required this.planImagePaths, Key? key}) : super(key: key);

  static const route = "plan_images_page";

  final List<String> planImagePaths;

  @override
  Widget build(BuildContext context) {
    return MyPhotoViewGallery(
      imagePaths: Project.testProject.planImagePaths,
    );
  }
}
