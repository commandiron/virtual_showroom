import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/pages/project_info/widget/animated_up_arrow.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/pages/project_info/widget/feature_item.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/pages/project_info/widget/progress_view.dart';

import '../../../../core/presentation/config/app_padding.dart';
import '../../../../core/presentation/config/app_space.dart';
import '../../../../core/presentation/config/app_text_style.dart';

class ResponsiveProjectInfoPage extends StatefulWidget {
  const ResponsiveProjectInfoPage(
    {
      required this.startDate,
      required this.estimatedFinishDate,
      required this.features,
      required this.listItemAspectRatio,
      Key? key
    }
  ) : super(key: key);

  final DateTime startDate;
  final DateTime estimatedFinishDate;
  final List<String> features;
  final double listItemAspectRatio;

  @override
  State< ResponsiveProjectInfoPage> createState() => _ResponsiveProjectInfoPageState();
}

class _ResponsiveProjectInfoPageState extends State< ResponsiveProjectInfoPage> {

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    AppSpace.verticalL!,
                    ProgressView(
                      startDate: widget.startDate,
                      estimatedFinishDate: widget.estimatedFinishDate
                    ),
                    AppSpace.verticalXL!,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Bitiş tarihi:", style: AppTextStyle.b1!,),
                        Text(DateFormat("MM/yyyy").format(widget.estimatedFinishDate), style: AppTextStyle.b1b!,),
                      ],
                    ),
                    AppSpace.verticalL!,
                    Padding(
                      padding: AppPadding.horizontalM!,
                      child: Text("Proje Özellikleri", style: AppTextStyle.h3b!,)
                    ),
                    AppSpace.verticalL!,
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: AppPadding.horizontalS!,
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: widget.listItemAspectRatio,
                ),
                delegate: SliverChildBuilderDelegate(
                  childCount: widget.features.length,
                  (context, index) => FeatureItem(feature: widget.features[index])
                )
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 300,
              ),
            )
          ],
        ),
        AnimatedUpArrow(scrollController: _scrollController)
      ],
    );
  }
}

