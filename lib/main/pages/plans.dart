import 'package:flutter/material.dart';
import 'package:virtual_showroom/main/widget/my_photo_view_gallery.dart';

import '../../model/project.dart';

class Plans extends StatelessWidget {
  const Plans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyPhotoViewGallery(
      imagePaths: Project.project1.planImagePaths,
    );
  }
}
