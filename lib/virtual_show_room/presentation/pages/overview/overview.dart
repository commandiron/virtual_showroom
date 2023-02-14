import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/pages/overview/widget/close_fullscreen_button.dart';
import '../../../cubit/screen/screen_cubit.dart';
import '../../widget/custom_dots_indicator.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({required this.generalImagePaths, Key? key}) : super(key: key);

  static const route = "overview";

  final List<String> generalImagePaths;

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {

  final PageController _pageController = PageController();
  final PhotoViewScaleStateController _photoViewScaleStateController = PhotoViewScaleStateController();

  @override
  void initState() {
    _photoViewScaleStateController.addIgnorableListener(() {
      setState(() {});
    });
    _pageController.addListener(() {
      setState((){});
    });
    super.initState();
  }

  @override
  void dispose() {
    _photoViewScaleStateController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PhotoViewGallery.builder(
          pageController: _pageController,
          itemCount: widget.generalImagePaths.length,
          scrollPhysics:  _photoViewScaleStateController.scaleState != PhotoViewScaleState.initial
            ? const NeverScrollableScrollPhysics()
            : const AlwaysScrollableScrollPhysics(),
          scaleStateChangedCallback: (value) {
            _photoViewScaleStateController.scaleState = value;
            if(value == PhotoViewScaleState.initial) {
              BlocProvider.of<ScreenCubit>(context, listen: false).collapseScreen();
            } else {
              BlocProvider.of<ScreenCubit>(context, listen: false).expandScreen();
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
                print(actual);
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
        if(_photoViewScaleStateController.scaleState == PhotoViewScaleState.initial)
          CustomDotsIndicator(
            dotsCount: widget.generalImagePaths.length,
            position: _pageController.hasClients ? _pageController.page ?? 0 : 0
          ),
        if(_photoViewScaleStateController.scaleState != PhotoViewScaleState.initial)
          CloseFullScreenButton(
            onPressed: () {
              _photoViewScaleStateController.scaleState = PhotoViewScaleState.initial;
            },
          )
      ],
    );
  }
}


