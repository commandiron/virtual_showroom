import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/pages/overview/widget/close_fullscreen_button.dart';
import '../../../cubit/animation/animation_cubit.dart';
import '../../widget/custom_dots_indicator.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({required this.generalImagePaths, Key? key}) : super(key: key);

  static const route = "overview";

  final List<String> generalImagePaths;

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {

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
              BlocProvider.of<AnimationCubit>(context).collapseScreen();
            } else {
              BlocProvider.of<AnimationCubit>(context).expandScreen();
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
          CustomDotsIndicator(
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


