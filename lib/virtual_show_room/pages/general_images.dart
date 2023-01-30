import 'package:flutter/material.dart';
import '../../model/project.dart';
import '../widget/my_photo_view_gallery.dart';

class GeneralImagesPage extends StatelessWidget {
  const GeneralImagesPage({required this.generalImagePaths, Key? key}) : super(key: key);

  static const route = "general_images";

  final List<String> generalImagePaths;

  @override
  Widget build(BuildContext context) {
    return  MyPhotoViewGallery(
      imagePaths: Project.testProject.generalImagePaths,
    );
  }
}


