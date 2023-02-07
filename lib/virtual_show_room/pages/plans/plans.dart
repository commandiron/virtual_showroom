import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import 'package:virtual_showroom/configs/app_padding.dart';
import 'package:virtual_showroom/model/project.dart';
import 'package:virtual_showroom/provider/app_state_provider.dart';
import 'package:virtual_showroom/virtual_show_room/pages/plans/widget/apartment_item.dart';
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
              }
            )
          ).toList(),
        ),
      )
      : Center(
        child: Stack(
          children: [
            PhotoViewGallery.builder(
              pageController: _pageController,
              itemCount: _selectedApartment!.imagePaths.length,
              backgroundDecoration: BoxDecoration(
                color: const Color(0xff626262),
              ),
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider:AssetImage(_selectedApartment!.imagePaths[index]),
                );
              },
            ),
            if (_selectedApartment!.imagePaths.length > 1)
              AppDotsIndicator(
                dotsCount: _selectedApartment!.imagePaths.length,
                position: _currentIndex
              ),
            Padding(
              padding: AppPadding.allS!,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context)
                    .colorScheme
                    .secondaryContainer
                    .withOpacity(0.90),
                  borderRadius: BorderRadius.all(Radius.circular(36))
                ),
                child: BackButton(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  onPressed: () {
                    setState(() {
                      _selectedApartment = null;
                      Provider.of<AppStateProvider>(context, listen: false)
                          .setScreenStateCollapsed();
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      );
  }
}