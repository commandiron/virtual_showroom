import 'package:flutter/material.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/pages/ar/responsive_ar.dart';
import '../../../../core/presentation/responsive/responsive.dart';


class ArPage extends StatelessWidget {
  const ArPage({Key? key}) : super(key: key);

  static const route = "ar";

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ResponsiveArPage(imageWidthFactor: 0.75, logoWidthFactor: 0.25,),
      tablet: ResponsiveArPage(imageWidthFactor: 0.65, logoWidthFactor: 0.20,),
      desktop: ResponsiveArPage(imageWidthFactor: 0.55, logoWidthFactor: 0.15,),
    );
  }
}
