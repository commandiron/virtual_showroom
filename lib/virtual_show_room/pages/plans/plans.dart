import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_showroom/model/project.dart';
import 'package:virtual_showroom/provider/app_state_provider.dart';
import 'package:virtual_showroom/virtual_show_room/pages/plans/widget/apartment_item.dart';
import 'package:virtual_showroom/virtual_show_room/pages/plans/widget/plan_detail.dart';

class PlansPage extends StatefulWidget {
  const PlansPage({required this.apartments, Key? key}) : super(key: key);

  static const route = "plans";

  final List<Apartment> apartments;

  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  Apartment? _selectedApartment;
  int _initialPage = 0;

  @override
  Widget build(BuildContext context) {
    return _selectedApartment == null
        ? SingleChildScrollView(
            child: Column(
              children: widget.apartments
                .map((apartment) => ApartmentItem(
                    apartment: apartment,
                    onSelect: (index) {
                      _initialPage = index.toInt();
                      setState(() {
                        _selectedApartment = apartment;
                        Provider.of<AppStateProvider>(context, listen: false)
                            .setScreenStateExpanded(isAnimated: true);
                      });
                    }))
                .toList(),
            ),
          )
        : PlanDetail(
            initialPage: _initialPage,
            apartment: _selectedApartment!,
            onBack: () {
              setState(() {
                _selectedApartment = null;
                Provider.of<AppStateProvider>(context, listen: false)
                    .setScreenStateCollapsed();
              });
            },
          );
  }
}
