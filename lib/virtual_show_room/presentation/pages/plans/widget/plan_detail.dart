import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';
import '../../../../../core/domain/model/project.dart';
import '../../../widget/custom_dots_indicator.dart';
import 'app_back_button.dart';
import 'lottie_animation.dart';

class PlanDetail extends StatefulWidget {
  const PlanDetail(
    {
      required this.apartment,
      required this.initialPage,
      this.onBack,
      super.key
    }
  );

  final Apartment apartment;
  final int initialPage;
  final void Function()? onBack;

  @override
  State<PlanDetail> createState() => _PlanDetailState();
}

class _PlanDetailState extends State<PlanDetail>{

  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.initialPage);
    _pageController.addListener(() {
      setState(() {});
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
    return Stack(
      children: [
        Center(
          child: Stack(
            children: [
              PhotoViewGallery.builder(
                pageController: _pageController,
                itemCount: widget.apartment.imagePaths.length,
                backgroundDecoration: const BoxDecoration(
                  color: Colors.black,
                ),
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(widget.apartment.imagePaths[index]),
                  );
                },
              ),
              if (widget.apartment.imagePaths.length > 1)
                CustomDotsIndicator(
                  dotsCount: widget.apartment.imagePaths.length,
                  position: _pageController.hasClients ? _pageController.page ?? 0 : 0
                ),
              AppBackButton(
                onPressed: widget.onBack,
              )
            ],
          ),
        ),
        const LottieAnimation(),
      ],
    );
  }
}
