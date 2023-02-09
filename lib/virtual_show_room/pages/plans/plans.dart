import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_showroom/model/project.dart';
import 'package:virtual_showroom/virtual_show_room/pages/plans/widget/apartment_item.dart';
import 'package:virtual_showroom/virtual_show_room/pages/plans/widget/plan_detail.dart';
import '../../../cubit/app/app_cubit.dart';

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
                        BlocProvider.of<AppCubit>(context).expandScreen();
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
                BlocProvider.of<AppCubit>(context).collapseScreen();
              });
            },
          );
  }
}
