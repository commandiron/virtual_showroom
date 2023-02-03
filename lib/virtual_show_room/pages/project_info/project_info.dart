import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:virtual_showroom/configs/app_padding.dart';
import 'package:virtual_showroom/configs/app_space.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';
import 'package:virtual_showroom/virtual_show_room/pages/project_info/widget/animated_up_arrow.dart';
import 'package:virtual_showroom/virtual_show_room/pages/project_info/widget/progress_view.dart';
import 'package:virtual_showroom/virtual_show_room/pages/project_info/widget/feature_item.dart';

class ProjectInfoPage extends StatefulWidget {
  const ProjectInfoPage(
    {
      required this.startDate,
      required this.estimatedFinishDate,
      required this.features,
      Key? key
    }
  ) : super(key: key);

  static const route = "project_info";

  final DateTime startDate;
  final DateTime estimatedFinishDate;
  final List<String> features;

  @override
  State<ProjectInfoPage> createState() => _ProjectInfoPageState();
}

class _ProjectInfoPageState extends State<ProjectInfoPage> {

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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
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

