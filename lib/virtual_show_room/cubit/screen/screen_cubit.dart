import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'screen_state.dart';

class ScreenCubit extends Cubit<ScreenState> {
  ScreenCubit() : super(
    ScreenState(
      animationEnabled: false,
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
        animationEnabled: state.animationEnabled,
        navigationAnimSlideDuration: state.navigationAnimSlideDuration,
        navigationAnimContainerDuration: state.navigationAnimContainerDuration,
        navigationOffset: state.navigationOffset,
        navigationHeight: state.navigationHeight,
        appBarAnimSlideDuration: state.appBarAnimSlideDuration,
        appBarAnimContainerDuration: state.appBarAnimContainerDuration,
        appBarOffset: state.appBarOffset,
        appBarHeight: state.appBarHeight,
        orientation: orientation,
        isTitleVisible: state.isTitleVisible,
        isFooterVisible: state.isFooterVisible,
        isOnMobile: state.isOnMobile
      )
    );

    if(orientation == Orientation.landscape && state.isOnMobile) {
      animatedExpand(isTitleVisible: false, isFooterVisible: false);
      return;
    }

    if(orientation == Orientation.portrait) {
      animatedCollapse(isTitleVisible: true, isFooterVisible: true);
      return;
    }
  }

  void animatedExpand({bool? isTitleVisible, bool? isFooterVisible}) {
    emit(
      ScreenState(
        animationEnabled: state.animationEnabled,
        navigationAnimSlideDuration: state.animationEnabled == true ? 150 : 0,
        navigationAnimContainerDuration:  state.animationEnabled == true ? 300 : 0,
        navigationOffset: const Offset(0, 1),
        navigationHeight: 0,
        appBarAnimSlideDuration: state.animationEnabled == true ? 150 : 0,
        appBarAnimContainerDuration: state.animationEnabled == true ? 300 : 0,
        appBarOffset: const Offset(0, -1),
        appBarHeight: 0,
        isTitleVisible: isTitleVisible ?? state.isTitleVisible,
        isFooterVisible: isFooterVisible ?? state.isFooterVisible,
        orientation: state.orientation,
        isOnMobile: state.isOnMobile
      )
    );
  }

  void animatedCollapse({bool? isTitleVisible, bool? isFooterVisible}) {

    if(state.isOnMobile && state.orientation == Orientation.landscape) {
      return;
    }

    emit(
      ScreenState(
        animationEnabled: state.animationEnabled,
        navigationAnimSlideDuration: state.animationEnabled == true ? 600 : 0,
        navigationAnimContainerDuration: state.animationEnabled == true ? 300 : 0,
        navigationOffset: Offset.zero,
        navigationHeight: 100,
        appBarAnimSlideDuration: state.animationEnabled == true ? 600 : 0,
        appBarAnimContainerDuration: state.animationEnabled == true ? 300 : 0,
        appBarOffset: Offset.zero,
        appBarHeight: 60,
        isTitleVisible: isTitleVisible ?? state.isTitleVisible,
        isFooterVisible: isFooterVisible ?? state.isFooterVisible,
        orientation: state.orientation,
        isOnMobile: state.isOnMobile
      )
    );
  }

  void setTitleVisibility(bool isVisible) {
    emit(
      ScreenState(
        animationEnabled: state.animationEnabled,
        navigationAnimSlideDuration: state.navigationAnimSlideDuration,
        navigationAnimContainerDuration: state.navigationAnimContainerDuration,
        navigationOffset: state.navigationOffset,
        navigationHeight: state.navigationHeight,
        appBarAnimSlideDuration: state.appBarAnimSlideDuration,
        appBarAnimContainerDuration: state.appBarAnimContainerDuration,
        appBarOffset: state.appBarOffset,
        appBarHeight: state.appBarHeight,
        orientation: state.orientation,
        isTitleVisible: isVisible,
        isFooterVisible: state.isFooterVisible,
        isOnMobile: state.isOnMobile
      )
    );
  }
}
