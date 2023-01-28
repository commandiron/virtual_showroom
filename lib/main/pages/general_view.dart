import 'package:flutter/material.dart';
import '../../model/project.dart';
import '../widget/my_photo_view_gallery.dart';

class GeneralView extends StatelessWidget {
  const GeneralView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MyPhotoViewGallery(
      imagePaths: Project.project1.generalViewImagePaths,
    );
  }
}


