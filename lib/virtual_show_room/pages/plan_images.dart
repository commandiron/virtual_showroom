import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import 'package:virtual_showroom/configs/app_padding.dart';
import 'package:virtual_showroom/model/project.dart';
import 'package:virtual_showroom/provider/app_state_provider.dart';
import 'package:virtual_showroom/virtual_show_room/widget/app_dots_indicator.dart';

class PlanImagesPage extends StatefulWidget {
  const PlanImagesPage({required this.apartments, Key? key}) : super(key: key);

  static const route = "plan_images";

  final List<Apartment> apartments;

  @override
  State<PlanImagesPage> createState() => _PlanImagesPageState();
}

class _PlanImagesPageState extends State<PlanImagesPage> {
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
      {required this.apartment, required this.onSelect, Key? key})
      : super(key: key);

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
                                widget.apartment.imagePaths[index]));
                      },
                    )),
                if (widget.apartment.imagePaths.length > 1)
                  AppDotsIndicator(
                      dotsCount: widget.apartment.imagePaths.length,
                      position: _currentIndex)
              ],
            ),
            SizedBox(
              height: 100,
              child: Text("Test"),
            )
          ],
        ),
      ),
    );
  }
}
