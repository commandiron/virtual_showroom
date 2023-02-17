import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/pages/plans/widget/plan_feature_item.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/pages/plans/widget/zoom_in_button.dart';
import '../../../../../core/presentation/config/app_padding.dart';
import '../../../../../core/presentation/config/app_text_style.dart';
import '../../../../../core/domain/model/project.dart';
import '../../../widget/custom_dots_indicator.dart';

class ApartmentItem extends StatefulWidget {
  const ApartmentItem(
    {
      required this.imageHeight,
      required this.footerHeight,
      required this.apartment,
      required this.onSelect,
      Key? key
    }
  ) : super(key: key);

  final double imageHeight;
  final double footerHeight;
  final Apartment apartment;
  final Function(double index) onSelect;



  @override
  State<ApartmentItem> createState() => _ApartmentItemState();
}

class _ApartmentItemState extends State<ApartmentItem> {

  final PageController _pageController = PageController();

  @override
  void initState() {
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
    return Padding(
      padding: AppPadding.allM!,
      child: Card(
        color: Theme.of(context).colorScheme.background,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: Theme.of(context).colorScheme.primaryContainer
          )
        ),
        borderOnForeground: true,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: widget.imageHeight,
                  color: const Color(0xff626262),
                  child: PhotoViewGallery.builder(
                    pageController: _pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.apartment.imageUrls.length,
                    scaleStateChangedCallback: (value) {
                      if(value != PhotoViewScaleState.initial) {
                        widget.onSelect(_pageController.page ?? 0);
                      }
                    },
                    builder: (context, index) {
                      return PhotoViewGalleryPageOptions(
                        imageProvider: CachedNetworkImageProvider(
                          widget.apartment.imageUrls[index]
                        ),
                      );
                    },
                  )
                ),
                ZoomInButton(
                  onTap: () {
                    widget.onSelect(_pageController.page ?? 0);
                  },
                ),
                if (widget.apartment.imageUrls.length > 1)
                  CustomDotsIndicator(
                    dotsCount: widget.apartment.imageUrls.length,
                    position: _pageController.hasClients ? _pageController.page ?? 0 : 0
                  ),
              ],
            ),
            Container(
              height: widget.footerHeight,
              padding: AppPadding.allM,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8
                    ),
                    child: Text(widget.apartment.title, style: AppTextStyle.b2,),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        PlanFeatureItem(
                          icon: Icons.open_in_full_sharp,
                          title: "Net",
                          body: "${widget.apartment.netArea} m²",
                        ),
                        Padding(
                          padding: AppPadding.allS!,
                          child: const VerticalDivider(),
                        ),
                        PlanFeatureItem(
                          icon: Icons.chair,
                          title: "Oda",
                          body: widget.apartment.type
                        ),
                      ],
                    ),
                  )
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}