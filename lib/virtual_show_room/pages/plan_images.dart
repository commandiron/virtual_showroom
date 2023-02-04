import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:virtual_showroom/configs/app_padding.dart';
import 'package:virtual_showroom/model/project.dart';
import 'package:virtual_showroom/virtual_show_room/pages/image_detail.dart';

class PlanImagesPage extends StatefulWidget {
  const PlanImagesPage({required this.apartments, Key? key}) : super(key: key);

  static const route = "plan_images";

  final List<Apartment> apartments;

  @override
  State<PlanImagesPage> createState() => _PlanImagesPageState();
}

class _PlanImagesPageState extends State<PlanImagesPage> {

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: widget.apartments.map(
          (apartment) => Padding(
            padding: AppPadding.allM!,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(32)
              ),
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(32)
                  ),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1,
                      strokeAlign: StrokeAlign.inside
                  )
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: PhotoViewGallery.builder(
                        itemCount: apartment.imagePaths.length,
                        backgroundDecoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        onPageChanged: (index) {
                          _pageIndex = index;
                        },
                        builder: (context, index) {
                          return PhotoViewGalleryPageOptions(
                            initialScale: PhotoViewComputedScale.contained,
                            minScale: PhotoViewComputedScale.contained,
                            maxScale: PhotoViewComputedScale.contained,
                            imageProvider: AssetImage(apartment.imagePaths[index]),
                            heroAttributes: PhotoViewHeroAttributes(tag: "${apartment.id}"),
                          );
                        },
                      )
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text("Test"),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context, MaterialPageRoute(
                                  builder: (context) {
                                    return ImageDetailPage(
                                      imagePaths: apartment.imagePaths,
                                      initialPage: _pageIndex,
                                      heroTag: "${apartment.id}"
                                    );
                                  },
                                )
                              );
                            },
                            child: Text("İncele")
                          )
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ),
          )
        ).toList(),
      ),
    );
  }
}

