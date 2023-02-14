part of '../screen/screen_cubit.dart';

class ScreenState {
  int navigationAnimSlideDuration;
  int navigationAnimContainerDuration;
  Offset navigationOffset;
  double navigationHeight;
  int appBarAnimDuration;
  Offset appBarOffset;
  double appBarHeight;
  bool isTitleVisible;
  Orientation orientation;
  bool isOnMobile;

  ScreenState(
    {
      required this.navigationAnimSlideDuration,
      required this.navigationAnimContainerDuration,
      required this.navigationOffset,
      required this.navigationHeight,
      required this.appBarAnimDuration,
      required this.appBarOffset,
      required this.appBarHeight,
      required this.isTitleVisible,
      required this.orientation,
      required this.isOnMobile
    }
  );
}
