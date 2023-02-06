import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import 'package:virtual_showroom/configs/app_padding.dart';
import 'package:virtual_showroom/configs/app_space.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';
import 'package:virtual_showroom/model/project.dart';
import 'package:virtual_showroom/provider/app_state_provider.dart';
import 'package:virtual_showroom/virtual_show_room/widget/app_dots_indicator.dart';

class PlansPage extends StatefulWidget {
  const PlansPage({required this.apartments, Key? key}) : super(key: key);

  static const route = "plans";

  final List<Apartment> apartments;

  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  Apartment? _selectedApartment;

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
    return _selectedApartment == null
        ? SingleChildScrollView(
            child: Column(
              children: widget.apartments
                  .map((apartment) => ApartmentItem(
                      apartment: apartment,
                      onSelect: () {
                        setState(() {
                          _selectedApartment = apartment;
                          Provider.of<AppStateProvider>(context, listen: false)
                              .setScreenStateExpanded(isAnimated: true);
                        });
                      }))
                  .toList(),
            ),
          )
        : Center(
            child: Stack(
              children: [
                PhotoViewGallery.builder(
                  pageController: _pageController,
                  itemCount: _selectedApartment!.imagePaths.length,
                  builder: (context, index) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider:AssetImage(_selectedApartment!.imagePaths[index]),
                    );
                  },
                ),
                if (_selectedApartment!.imagePaths.length > 1)
                  AppDotsIndicator(
                      dotsCount: _selectedApartment!.imagePaths.length,
                      position: _currentIndex),
                BackButton(
                  onPressed: () {
                    setState(() {
                      _selectedApartment = null;
                      Provider.of<AppStateProvider>(context, listen: false)
                          .setScreenStateCollapsed();
                    });
                  },
                )
              ],
            ),
          );
  }
}

class ApartmentItem extends StatefulWidget {
  const ApartmentItem(
    {
      required this.apartment,
      required this.onSelect,
      Key? key
    }
  ) : super(key: key);

  final Apartment apartment;
  final Function onSelect;

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
        color: Colors.white,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        borderOnForeground: true,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 200,
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.apartment.imagePaths.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onDoubleTap: () {
                          widget.onSelect();
                        },
                        child: Image.asset(
                          widget.apartment.imagePaths[index]
                        )
                      );
                    },
                  )
                ),
                if (widget.apartment.imagePaths.length > 1)
                  AppDotsIndicator(
                    dotsCount: widget.apartment.imagePaths.length,
                    position: _currentIndex
                  )
              ],
            ),
            Container(
              height: 120,
              padding: AppPadding.allM,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.apartment.title, style: AppTextStyle.b1b,),
                  Expanded(
                    child: Row(
                      children: [
                        PlanFeatureItem(
                          icon: Icons.area_chart,
                          title: "m² Net",
                          body: widget.apartment.netArea
                        ),
                        Padding(
                          padding: AppPadding.verticalS!,
                          child: const VerticalDivider(),
                        ),
                        PlanFeatureItem(
                          icon: Icons.room,
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

class PlanFeatureItem extends StatelessWidget {
  const PlanFeatureItem(
    {
      required this.icon,
      required this.title,
      required this.body,
      Key? key
    }
  ) : super(key: key);

  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12)
                  )
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          AppSpace.horizontalL!,
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyle.b2!.copyWith(color: Colors.grey)),
                Text(body, style: AppTextStyle.b1b,),
              ],
            ),
          ),
        ]
      )
    );
  }
}

