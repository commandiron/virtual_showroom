import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:virtual_showroom/model/project.dart';

import '../../../../configs/app_padding.dart';
import '../../../widget/app_dots_indicator.dart';

class PlanDetail extends StatefulWidget {
  const PlanDetail(
      {required this.apartment,
      required this.initialPage,
      this.onBack,
      super.key});

  final Apartment apartment;
  final int initialPage;
  final void Function()? onBack;

  @override
  State<PlanDetail> createState() => _PlanDetailState();
}

class _PlanDetailState extends State<PlanDetail> with TickerProviderStateMixin {
  double _currentIndex = 0;
  late final PageController _pageController;
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    _pageController = PageController(initialPage: widget.initialPage);
    _currentIndex = widget.initialPage.toDouble();
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page ?? 0;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          PhotoViewGallery.builder(
            pageController: _pageController,
            itemCount: widget.apartment.imagePaths.length,
            backgroundDecoration: const BoxDecoration(
              color: Color(0xff626262),
            ),
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: AssetImage(widget.apartment.imagePaths[index]),
              );
            },
          ),
          if (widget.apartment.imagePaths.length > 1)
            AppDotsIndicator(
                dotsCount: widget.apartment.imagePaths.length,
                position: _currentIndex),
          IgnorePointer(
            child: Center(
              child: Lottie.network(
                "https://assets8.lottiefiles.com/packages/lf20_YJZ0dWUhOD.json",
                controller: _animationController,
                onLoaded: (composition) {
                  _animationController
                    ..duration = composition.duration
                    ..forward();
                },
              ),
            ),
          ),
          Padding(
            padding: AppPadding.allS!,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primary
                      .withOpacity(0.90),
                  borderRadius: const BorderRadius.all(Radius.circular(36))),
              child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  onPressed: widget.onBack),
            ),
          ),
        ],
      ),
    );
  }
}
