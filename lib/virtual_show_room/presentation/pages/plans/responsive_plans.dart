import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/pages/plans/widget/apartment_item.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/pages/plans/widget/plan_detail.dart';

import '../../../../core/domain/model/project.dart';
import '../../../cubit/screen/screen_cubit.dart';

class ResponsivePlansPage extends StatefulWidget {
  const ResponsivePlansPage(
    {
      required this.apartments,
      required this.imageHeight,
      required this.footerHeight,
      Key? key
    }
  ) : super(key: key);

  final List<Apartment> apartments;
  final double imageHeight;
  final double footerHeight;

  @override
  State<ResponsivePlansPage> createState() => _ResponsivePlansPageState();
}

class _ResponsivePlansPageState extends State<ResponsivePlansPage> {
  Apartment? _selectedApartment;
  int _initialPage = 0;

  @override
  Widget build(BuildContext context) {
    return _selectedApartment == null
      ? SingleChildScrollView(
        child: Column(
          children: widget.apartments
            .map((apartment) => ApartmentItem(
              imageHeight: widget.imageHeight,
              footerHeight: widget.footerHeight,
              apartment: apartment,
              onSelect: (index) {
                _initialPage = index.toInt();
                setState(() {
                  _selectedApartment = apartment;
                  BlocProvider.of<ScreenCubit>(context, listen: false).expandScreen();
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
            BlocProvider.of<ScreenCubit>(context, listen: false).collapseScreen();
          });
        },
      );
  }
}
