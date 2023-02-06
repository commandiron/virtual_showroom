import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import 'package:virtual_showroom/virtual_show_room/pages/general_images/widget/close_fullscreen_button.dart';
import '../../../provider/app_state_provider.dart';
import '../../widget/app_dots_indicator.dart';

class GeneralImagesPage extends StatefulWidget {
  const GeneralImagesPage({required this.generalImagePaths, Key? key}) : super(key: key);

  static const route = "general_images";

  final List<String> generalImagePaths;

  @override
  State<GeneralImagesPage> createState() => _GeneralImagesPageState();
}

class _GeneralImagesPageState extends State<GeneralImagesPage> {

  double _currentIndex = 0;
  final PageController _pageController = PageController();
  PhotoViewScaleState _photoViewScaleState = PhotoViewScaleState.initial;

  final PhotoViewScaleStateController _photoViewScaleStateController = PhotoViewScaleStateController();

  @override
  void initState() {
    _pageController.addListener(() {
      setState((){
        _currentIndex = _pageController.page ?? 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PhotoViewGallery.builder(
          pageController: _pageController,
          itemCount: widget.generalImagePaths.length,
          scrollPhysics: _photoViewScaleState != PhotoViewScaleState.initial
            ? const NeverScrollableScrollPhysics()
            : const AlwaysScrollableScrollPhysics(),
          scaleStateChangedCallback: (value) {
            setState((){
              _photoViewScaleState = value;
            });
            if(value == PhotoViewScaleState.initial) {
              Provider.of<AppStateProvider>(context, listen: false).setScreenStateCollapsed();
            } else {
              Provider.of<AppStateProvider>(context, listen: false).setScreenStateExpanded();
            }
          },
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              scaleStateController: _photoViewScaleStateController,
              imageProvider: AssetImage(widget.generalImagePaths[index]),
              initialScale: PhotoViewComputedScale.contained * 1,
              minScale: PhotoViewComputedScale.contained * 1,
              maxScale: PhotoViewComputedScale.contained * 4,
              scaleStateCycle: (actual) {
                switch (actual) {
                  case PhotoViewScaleState.initial:
                    return PhotoViewScaleState.originalSize;
                  default:
                    return PhotoViewScaleState.initial;
                }
              },
            );
          },
          backgroundDecoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
          )
        ),
        if(_photoViewScaleState == PhotoViewScaleState.initial)
          AppDotsIndicator(
            dotsCount: widget.generalImagePaths.length,
            position: _currentIndex
          ),
        if(_photoViewScaleState != PhotoViewScaleState.initial)
          CloseFullScreenButton(
            onPressed: () {
              _photoViewScaleStateController.scaleState = PhotoViewScaleState.initial;
            },
          )
      ],
    );
  }
}


