import 'package:auto_size_text/auto_size_text.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:virtual_showroom/configs/app_padding.dart';
import 'package:virtual_showroom/configs/app_space.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';
import 'package:virtual_showroom/provider/app_state_provider.dart';

import '../../model/project.dart';

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

  Offset _upArrowOffset = Offset(0.5, 0);
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if(_scrollController.offset > 0 ){
        setState(() {
          _upArrowOffset = Offset.zero;
        });
        Provider.of<AppStateProvider>(context, listen: false).setScreenStateExpanded(isAnimated: true);
      } else {
        setState(() {
          _upArrowOffset = Offset(0.5, 0);
        });
        Provider.of<AppStateProvider>(context, listen: false).setScreenStateCollapsed();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final estimatedTotalDuration = widget.estimatedFinishDate.difference(widget.startDate).inDays;
    final passedTime = DateTime.now().difference(widget.startDate).inDays;

    return Stack(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                AppSpace.verticalL!,
                SizedBox(
                  width: 200,
                  child: CircleProgressBar(
                    backgroundColor:  Theme.of(context).colorScheme.primaryContainer,
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    animationDuration: Duration(milliseconds: 2000),
                    value: passedTime / estimatedTotalDuration,
                    strokeWidth: 16,
                    child: Container(
                      alignment: Alignment.center,
                      padding: AppPadding.allM,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "İnşaat Tamamlanma Yüzdesi:",
                            textAlign: TextAlign.center,
                            style: AppTextStyle.b2!,
                          ),
                          AnimatedCount(
                            count: (passedTime / estimatedTotalDuration) * 100,
                            fractionDigits: 0,
                            unit: '%',
                            duration: Duration(milliseconds: 2000),
                            curve: Curves.fastOutSlowIn,
                            style: AppTextStyle.b1b!,
                          ),
                        ],
                      ),
                    ),
                  ),
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
                InfoGridView(
                  specs: widget.generalSpecs
                ),
                const SizedBox(
                  height: 1000,
                ),
              ],
            ),
          ),
        ),
        AnimatedSlide(
          offset: _upArrowOffset,
          duration: Duration(milliseconds: 300),
          child: Container(
            alignment: Alignment.bottomRight,
            padding: AppPadding.allM,
            child: Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              ),
              child: InkWell(
                onTap: () {
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut
                  );
                },
                radius: 64,
                borderRadius: BorderRadius.circular(8),
                child: Icon(
                  Icons.arrow_drop_up_outlined,
                  size: 36,
                  color: Theme.of(context).colorScheme.primary
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class InfoGridView extends StatelessWidget {
  const InfoGridView({required this.specs, Key? key}) : super(key: key);

  final List<Spec> specs;

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: AppPadding.allS,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3
      ),
      children:
        specs.map(
          (spec) => AspectRatio(
            aspectRatio: 1,
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(16)
                  )
              ),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Padding(
                padding: AppPadding.allS!,
                child: Center(
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          spec.category,
                          style: AppTextStyle.b2!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimaryContainer
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: AutoSizeText(
                            spec.body,
                            style: AppTextStyle.h3b!.copyWith(
                                color: Theme.of(context).colorScheme.primary
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                        )
                      )
                    ],
                  ),
                )
              ),
            ),
          )
        ).toList(),
    );
  }
}

