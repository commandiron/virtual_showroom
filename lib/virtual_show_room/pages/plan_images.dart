import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import 'package:virtual_showroom/configs/app_padding.dart';
import 'package:virtual_showroom/model/project.dart';
import 'package:virtual_showroom/provider/app_state_provider.dart';

class PlanImagesPage extends StatefulWidget {
  const PlanImagesPage({required this.apartments, Key? key}) : super(key: key);

  static const route = "plan_images";

  final List<Apartment> apartments;

  @override
  State<PlanImagesPage> createState() => _PlanImagesPageState();
}

class _PlanImagesPageState extends State<PlanImagesPage> {

  Apartment? _selectedApartment;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: _selectedApartment == null ? SingleChildScrollView(
        child: Column(
          children: widget.apartments.map(
                  (apartment) => Padding(
                padding: AppPadding.allM!,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                      Radius.circular(32)
                  ),
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                    foregroundDecoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(32)
                        ),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1,
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
                              builder: (context, index) {
                                return PhotoViewGalleryPageOptions(
                                  initialScale: PhotoViewComputedScale.contained,
                                  minScale: PhotoViewComputedScale.contained,
                                  maxScale: PhotoViewComputedScale.contained,
                                  imageProvider: AssetImage(apartment.imagePaths[index]),
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
                                  setState(() {
                                    _selectedApartment = apartment;
                                    Provider.of<AppStateProvider>(
                                        context,
                                        listen: false
                                    ).setScreenStateExpanded(isAnimated: true);
                                  });
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
      ) : Center(
        child: PhotoViewGallery.builder(
          itemCount: _selectedApartment!.imagePaths.length,
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: AssetImage(_selectedApartment!.imagePaths[index]),
            );
          },
        ),
      ),
    );
  }
}

