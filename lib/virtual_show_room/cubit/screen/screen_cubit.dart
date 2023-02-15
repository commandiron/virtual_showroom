import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'screen_state.dart';

class ScreenCubit extends Cubit<ScreenState> {
  ScreenCubit() : super(
    ScreenState(
      navigationAnimSlideDuration: 0,
      navigationAnimContainerDuration: 0,
      navigationOffset: Offset.zero,
      navigationHeight: 100,
      appBarAnimDuration: 0,
      appBarOffset: Offset.zero,
      appBarHeight: 60,
      isTitleVisible: true,
      orientation: Orientation.portrait,
      isOnMobile: defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android
    )
  );

  void setOrientation(Orientation orientation) {
    emit(
      ScreenState(
        navigationAnimSlideDuration: state.navigationAnimSlideDuration,
        navigationAnimContainerDuration: state.navigationAnimContainerDuration,
        navigationOffset: state.navigationOffset,
        navigationHeight: state.navigationHeight,
        appBarAnimDuration: state.appBarAnimDuration,
        appBarOffset: state.appBarOffset,
        appBarHeight: state.appBarHeight,
        orientation: orientation,
        isTitleVisible: true,
        isOnMobile: state.isOnMobile
      )
    );

    if(orientation == Orientation.landscape && state.isOnMobile) {
      animatedExpand();
      return;
    }

    if(orientation == Orientation.portrait) {
      animatedCollapse();
      return;
    }
  }

  void animatedExpand() {
    emit(
      ScreenState(
        navigationAnimSlideDuration: 300,
        navigationAnimContainerDuration: 600,
        navigationOffset: const Offset(0, 1),
        navigationHeight: 0,
        appBarAnimDuration: 600,
        appBarOffset: const Offset(0, -1),
        appBarHeight: 0,
        isTitleVisible: !(state.isOnMobile && state.orientation == Orientation.landscape),
        orientation: state.orientation,
        isOnMobile: state.isOnMobile
      )
    );
  }

  void animatedCollapse() {

    if(state.isOnMobile && state.orientation == Orientation.landscape) {
      return;
    }

    emit(
      ScreenState(
        navigationAnimSlideDuration: 600,
        navigationAnimContainerDuration: 300,
        navigationOffset: Offset.zero,
        navigationHeight: 100,
        appBarAnimDuration: 600,
        appBarOffset: Offset.zero,
        appBarHeight: 60,
        isTitleVisible: true,
        orientation: state.orientation,
        isOnMobile: state.isOnMobile
      )
    );
  }
}