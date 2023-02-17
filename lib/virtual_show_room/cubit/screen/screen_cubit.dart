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
      appBarAnimSlideDuration: 0,
      appBarAnimContainerDuration: 0,
      appBarOffset: Offset.zero,
      appBarHeight: 60,
      isTitleVisible: true,
      isFooterVisible: true,
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
        appBarAnimSlideDuration: state.appBarAnimSlideDuration,
        appBarAnimContainerDuration: state.appBarAnimContainerDuration,
        appBarOffset: state.appBarOffset,
        appBarHeight: state.appBarHeight,
        orientation: orientation,
        isTitleVisible: true,
        isFooterVisible: true,
        isOnMobile: state.isOnMobile
      )
    );

    if(orientation == Orientation.landscape && state.isOnMobile) {
      animatedExpand(isTitleVisible: false, isFooterVisible: false);
      return;
    }

    if(orientation == Orientation.portrait) {
      animatedCollapse();
      return;
    }
  }

  void animatedExpand({bool isTitleVisible = true, bool isFooterVisible = true}) {
    emit(
      ScreenState(
        navigationAnimSlideDuration: 150,
        navigationAnimContainerDuration: 300,
        navigationOffset: const Offset(0, 1),
        navigationHeight: 0,
        appBarAnimSlideDuration: 150,
        appBarAnimContainerDuration: 300,
        appBarOffset: const Offset(0, -1),
        appBarHeight: 0,
        isTitleVisible: isTitleVisible,
        isFooterVisible: isFooterVisible,
        orientation: state.orientation,
        isOnMobile: state.isOnMobile
      )
    );
  }

  void animatedCollapse({bool isTitleVisible = true, bool isFooterVisible = true}) {

    if(state.isOnMobile && state.orientation == Orientation.landscape) {
      return;
    }

    emit(
      ScreenState(
        navigationAnimSlideDuration: 600,
        navigationAnimContainerDuration: 300,
        navigationOffset: Offset.zero,
        navigationHeight: 100,
        appBarAnimSlideDuration: 600,
        appBarAnimContainerDuration: 300,
        appBarOffset: Offset.zero,
        appBarHeight: 60,
        isTitleVisible: isTitleVisible,
        isFooterVisible: isFooterVisible,
        orientation: state.orientation,
        isOnMobile: state.isOnMobile
      )
    );
  }
}
