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
      this.navigationAnimSlideDuration = 0,
      this.navigationAnimContainerDuration = 0,
      this.navigationOffset = Offset.zero,
      this.navigationHeight = 100,
      this.appBarAnimDuration = 0,
      this.appBarOffset = Offset.zero,
      this.appBarHeight = 60,
      this.isTitleVisible = true,
      this.orientation = Orientation.portrait,
      this.isOnMobile = true
    }
  );
}
