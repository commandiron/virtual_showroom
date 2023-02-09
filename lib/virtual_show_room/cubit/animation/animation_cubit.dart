import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'animation_state.dart';

class AnimationCubit extends Cubit<AnimationState> {
  AnimationCubit() : super(
    AnimationState(
      navigationAnimSlideDuration: 0,
      navigationAnimContainerDuration: 0,
      navigationOffset: Offset.zero,
      navigationHeight: 100,
      appBarAnimDuration: 0,
      appBarOffset: Offset.zero,
      appBarHeight: 60
    )
  );

  void expandScreen({bool isAnimated = true}) {
    if(isAnimated) {
      emit(
        AnimationState(
          navigationAnimSlideDuration: 300,
          navigationAnimContainerDuration: 600,
          navigationOffset: const Offset(0, 1),
          navigationHeight: 0,
          appBarAnimDuration: 600,
          appBarOffset: const Offset(0, -1),
          appBarHeight: 0
        )
      );
    } else {
      emit(
        AnimationState(
          navigationAnimSlideDuration: 0,
          navigationAnimContainerDuration: 0,
          navigationOffset: const Offset(0, 1),
          navigationHeight: 0,
          appBarAnimDuration: 0,
          appBarOffset: const Offset(0, -1),
          appBarHeight: 0
        )
      );
    }
  }

  void collapseScreen({bool isAnimated = true}) {
    if(isAnimated) {
      emit(
        AnimationState(
          navigationAnimSlideDuration: 600,
          navigationAnimContainerDuration: 300,
          navigationOffset: Offset.zero,
          navigationHeight: 100,
          appBarAnimDuration: 600,
          appBarOffset: Offset.zero,
          appBarHeight: 60
        )
      );
    } else {
      emit(
        AnimationState(
          navigationAnimSlideDuration: 0,
          navigationAnimContainerDuration: 0,
          navigationOffset: Offset.zero,
          navigationHeight: 100,
          appBarAnimDuration: 0,
          appBarOffset: Offset.zero,
          appBarHeight: 60
        )
      );
    }
  }
}
