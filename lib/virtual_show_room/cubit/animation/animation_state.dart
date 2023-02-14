part of 'animation_cubit.dart';

class AnimationState {
  int navigationAnimSlideDuration;
  int navigationAnimContainerDuration;
  Offset navigationOffset;
  double navigationHeight;
  int appBarAnimDuration;
  Offset appBarOffset;
  double appBarHeight;
  Orientation orientation;

  AnimationState(
    {
      required this.navigationAnimSlideDuration,
      required this.navigationAnimContainerDuration,
      required this.navigationOffset,
      required this.navigationHeight,
      required this.appBarAnimDuration,
      required this.appBarOffset,
      required this.appBarHeight,
      required this.orientation
    }
  );
}
