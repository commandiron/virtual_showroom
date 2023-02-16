import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import '../../../../../core/domain/model/project.dart';
import '../../../widget/custom_dots_indicator.dart';
import 'app_back_button.dart';

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
  final PhotoViewScaleStateController _photoViewScaleStateController = PhotoViewScaleStateController();

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
    return Center(
      child: Stack(
        children: [
          GestureDetector(
            onVerticalDragEnd: (details) {
              if(details.velocity.pixelsPerSecond.dy.abs() > 100){
                if(_photoViewScaleStateController.scaleState == PhotoViewScaleState.initial) {
                  widget.onBack!();
                }
              }
            },
            child: PhotoViewGallery.builder(
              pageController: _pageController,
              itemCount: widget.apartment.imageUrls.length,
              backgroundDecoration: const BoxDecoration(
                color: Colors.black,
              ),
              builder: (context, index) {
                return PhotoViewGalleryPageOptions.customChild(
                  scaleStateController: _photoViewScaleStateController,
                  child: CachedNetworkImage(
                    imageUrl: widget.apartment.imageUrls[index],
                    placeholder: (context, url) {
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                );
              },
            ),
          ),
          if (widget.apartment.imageUrls.length > 1)
            CustomDotsIndicator(
              dotsCount: widget.apartment.imageUrls.length,
              position: _pageController.hasClients ? _pageController.page ?? 0 : 0
            ),
          AppBackButton(
            onPressed: widget.onBack,
          )
        ],
      ),
    );
  }
}
