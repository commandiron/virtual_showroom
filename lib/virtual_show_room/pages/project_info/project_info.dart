import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:virtual_showroom/configs/app_space.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';
import 'package:virtual_showroom/virtual_show_room/pages/project_info/widget/animated_up_arrow.dart';
import 'package:virtual_showroom/virtual_show_room/pages/project_info/widget/progress_view.dart';
import 'package:virtual_showroom/virtual_show_room/pages/project_info/widget/spec_item.dart';

import '../../../model/project.dart';

class ProjectInfoPage extends StatefulWidget {
  const ProjectInfoPage(
    {
      required this.startDate,
      required this.estimatedFinishDate,
      required this.generalSpecs,
      required this.apartmentSpecs,
      Key? key
    }
  ) : super(key: key);

  static const route = "project_info";

  final DateTime startDate;
  final DateTime estimatedFinishDate;
  final List<Spec> generalSpecs;
  final List<Spec> apartmentSpecs;

  @override
  State<ProjectInfoPage> createState() => _ProjectInfoPageState();
}

class _ProjectInfoPageState extends State<ProjectInfoPage> {

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
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
                Text("Proje Özellikleri", style: AppTextStyle.b1!,),
                AppSpace.verticalL!,
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3
                  ),
                  itemCount: widget.generalSpecs.length,
                  itemBuilder: (context, index) {
                    return SpecItem(
                      spec: widget.generalSpecs[index],
                    );
                  },
                ),
                const SizedBox(
                  height: 1000,
                ),
              ],
            ),
          )
        ),
        AnimatedUpArrow(scrollController: _scrollController)
      ],
    );
  }
}

