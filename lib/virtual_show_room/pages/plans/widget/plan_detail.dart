import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:virtual_showroom/model/project.dart';
import 'package:virtual_showroom/virtual_show_room/pages/plans/widget/app_back_button.dart';
import 'package:virtual_showroom/virtual_show_room/pages/plans/widget/lottie_animation.dart';
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

class _PlanDetailState extends State<PlanDetail>{
  double _currentIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
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
          const LottieAnimation(),
          AppBackButton(
            onPressed: widget.onBack,
          )
        ],
      ),
    );
  }
}
