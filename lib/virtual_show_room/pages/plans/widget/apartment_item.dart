import 'package:flutter/material.dart';
import 'package:virtual_showroom/virtual_show_room/pages/plans/widget/plan_feature_item.dart';
import '../../../../configs/app_padding.dart';
import '../../../../configs/app_text_style.dart';
import '../../../../model/project.dart';
import '../../../widget/app_dots_indicator.dart';

class ApartmentItem extends StatefulWidget {
  const ApartmentItem(
    {
      required this.apartment,
      required this.onSelect,
      Key? key
    }
  ) : super(key: key);

  final Apartment apartment;
  final Function(double index) onSelect;

  @override
  State<ApartmentItem> createState() => _ApartmentItemState();
}

class _ApartmentItemState extends State<ApartmentItem> {
  double _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page ?? 0;
      });
    });
    super.initState();
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
                  height: 200,
                  color: const Color(0xff626262),
                  child: PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.apartment.imagePaths.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onDoubleTap: () {
                          widget.onSelect(_currentIndex);
                        },
                        child: Image.asset(
                          widget.apartment.imagePaths[index]
                        )
                      );
                    },
                  )
                ),
                Container(
                  height: 200,
                  alignment: Alignment.topRight,
                  padding: AppPadding.allM,
                  child: InkWell(
                    onTap: () {
                      widget.onSelect(_currentIndex);
                    },
                    child: Container(
                      padding: AppPadding.allS!,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.90),
                        borderRadius: const BorderRadius.all(Radius.circular(32))
                      ),
                      child: Icon(
                        Icons.zoom_in,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  )
                ),
                if (widget.apartment.imagePaths.length > 1)
                  AppDotsIndicator(
                    dotsCount: widget.apartment.imagePaths.length,
                    position: _currentIndex
                  ),
              ],
            ),
            Container(
              height: 120,
              padding: AppPadding.allM,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.apartment.title, style: AppTextStyle.b2,),
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