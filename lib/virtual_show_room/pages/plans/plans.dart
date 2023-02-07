import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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

class _PlansPageState extends State<PlansPage> with TickerProviderStateMixin {

  Apartment? _selectedApartment;

  double _currentIndex = 0;
  final PageController _pageController = PageController();

  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
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
              backgroundDecoration: const BoxDecoration(
                color: Color(0xff626262),
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
            IgnorePointer(
              child: Center(
                child: Lottie.network(
                  "https://assets8.lottiefiles.com/packages/lf20_YJZ0dWUhOD.json",
                  frameRate: FrameRate.max,
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
                  color: Theme.of(context).colorScheme.secondaryContainer
                    .withOpacity(0.90),
                  borderRadius: const BorderRadius.all(Radius.circular(36))
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
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