import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import 'package:virtual_showroom/configs/app_padding.dart';
import '../../provider/app_state_provider.dart';

class MyPhotoViewGallery extends StatefulWidget {
  const MyPhotoViewGallery({required this.imagePaths, Key? key}) : super(key: key);

  final List<String> imagePaths;

  @override
  State<MyPhotoViewGallery> createState() => _MyPhotoViewGalleryState();
}

class _MyPhotoViewGalleryState extends State<MyPhotoViewGallery> {

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
          itemCount: widget.imagePaths.length,
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
        ),
        if(_photoViewScaleState == PhotoViewScaleState.initial)
          Align(
            alignment: Alignment.bottomCenter,
            child: DotsIndicator(
              dotsCount: widget.imagePaths.length,
              position:  _currentIndex,
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                activeColor: Theme.of(context).colorScheme.primary,
                color: Theme.of(context).colorScheme.onBackground
              ),
            ),
          ),
        if(_photoViewScaleState != PhotoViewScaleState.initial)
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: AppPadding.allM!,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.5),
                ),
                padding: AppPadding.allS!,
                child: IconButton(
                  onPressed: () {
                    _photoViewScaleStateController.scaleState = PhotoViewScaleState.initial;
                  },
                  icon: const Icon(Icons.close_fullscreen)
                ),
              ),
            ),
          ),
      ],
    );
  }
}

PhotoViewScaleState myScaleStateCycle(PhotoViewScaleState actual) {
  switch (actual) {
    case PhotoViewScaleState.initial:
      return PhotoViewScaleState.originalSize;
    default:
      return PhotoViewScaleState.initial;
  }
}
