part of '../screen/screen_cubit.dart';

class ScreenState {
  int navigationAnimSlideDuration;
  int navigationAnimContainerDuration;
  Offset navigationOffset;
  double navigationHeight;
  int appBarAnimSlideDuration;
  int appBarAnimContainerDuration;
  Offset appBarOffset;
  double appBarHeight;
  bool isTitleAndFooterVisible;
  Orientation orientation;
  bool isOnMobile;

  ScreenState(
    {
      required this.navigationAnimSlideDuration,
      required this.navigationAnimContainerDuration,
      required this.navigationOffset,
      required this.navigationHeight,
      required this.appBarAnimSlideDuration,
      required this.appBarAnimContainerDuration,
      required this.appBarOffset,
      required this.appBarHeight,
      required this.isTitleAndFooterVisible,
      required this.orientation,
      required this.isOnMobile
    }
  );
}
