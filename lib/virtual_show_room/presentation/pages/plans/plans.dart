import 'package:flutter/material.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/pages/plans/responsive_plans.dart';

import '../../../../core/domain/model/project.dart';
import '../../../../core/presentation/responsive/responsive.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({required this.apartments, Key? key}) : super(key: key);

  static const route = "plans";

  final List<Apartment> apartments;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: ResponsivePlansPage(
          apartments: apartments,
          imageHeight: 200,
          footerHeight: 120
      ),
      tablet: ResponsivePlansPage(
        apartments: apartments,
        imageHeight: 300,
        footerHeight: 140
      ),
      desktop: ResponsivePlansPage(
        apartments: apartments,
        imageHeight: 400,
        footerHeight: 160
      ),
    );
  }
}