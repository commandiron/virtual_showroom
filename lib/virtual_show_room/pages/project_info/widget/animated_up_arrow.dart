import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../configs/app_padding.dart';
import '../../../../provider/app_state_provider.dart';

class AnimatedUpArrow extends StatefulWidget {
  const AnimatedUpArrow({required this.scrollController, Key? key}) : super(key: key);

  final ScrollController scrollController;

  @override
  State<AnimatedUpArrow> createState() => _AnimatedUpArrowState();
}

class _AnimatedUpArrowState extends State<AnimatedUpArrow> {

  Offset _upArrowOffset = const Offset(0.5, 0);

  @override
  void initState() {
    widget.scrollController.addListener(() {
      if(widget.scrollController.offset > 0 ){
        setState(() {
          _upArrowOffset = Offset.zero;
        });
        Provider.of<AppStateProvider>(context, listen: false).setScreenStateExpanded(isAnimated: true);
      } else {
        setState(() {
          _upArrowOffset = const Offset(0.5, 0);
        });
        Provider.of<AppStateProvider>(context, listen: false).setScreenStateCollapsed();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: _upArrowOffset,
      duration: const Duration(milliseconds: 300),
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
              widget.scrollController.animateTo(
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
    );
  }
}