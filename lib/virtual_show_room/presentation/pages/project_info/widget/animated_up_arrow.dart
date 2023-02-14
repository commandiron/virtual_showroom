import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/config/app_padding.dart';
import '../../../../cubit/screen/screen_cubit.dart';


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
        BlocProvider.of<ScreenCubit>(context).expandScreen();
      } else {
        setState(() {
          _upArrowOffset = const Offset(0.5, 0);
        });
        BlocProvider.of<ScreenCubit>(context).collapseScreen();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: _upArrowOffset,
      duration: const Duration(milliseconds: 300),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: AppPadding.allM!,
          child: Card(
            color: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
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
                color: Theme.of(context).colorScheme.onPrimary
              ),
            ),
          ),
        ),
      ),
    );
  }
}
