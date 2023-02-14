import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'screen_state.dart';

class ScreenCubit extends Cubit<ScreenState> {
  ScreenCubit() : super(
    ScreenState(
      isOnMobile: defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android
    )
  );

  void setOrientation(Orientation orientation) {
    emit(
      ScreenState(
        orientation: orientation,
        isTitleVisible: true,
      )
    );

    if(orientation == Orientation.landscape && state.isOnMobile) {
      expandScreen();
      return;
    }

    if(orientation == Orientation.portrait) {
      collapseScreen();
      return;
    }
  }

  void expandScreen({bool isAnimated = true}) {
    if(isAnimated) {
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
        )
      );
    } else {
      emit(
        ScreenState(
          navigationAnimSlideDuration: 0,
          navigationAnimContainerDuration: 0,
          navigationOffset: const Offset(0, 1),
          navigationHeight: 0,
          appBarAnimDuration: 0,
          appBarOffset: const Offset(0, -1),
          appBarHeight: 0,
          isTitleVisible: !(state.isOnMobile && state.orientation == Orientation.landscape),
        )
      );
    }
  }

  void collapseScreen({bool isAnimated = true}) {
    if(!state.isOnMobile) {
      if(isAnimated) {
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
          )
        );
      } else {
        emit(
          ScreenState(
            navigationAnimSlideDuration: 0,
            navigationAnimContainerDuration: 0,
            navigationOffset: Offset.zero,
            navigationHeight: 100,
            appBarAnimDuration: 0,
            appBarOffset: Offset.zero,
            appBarHeight: 60,
            isTitleVisible: true,
          )
        );
      }
    } else {
      if(state.orientation == Orientation.portrait) {
        if(isAnimated) {
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
            )
          );
        } else {
          emit(
            ScreenState(
              navigationAnimSlideDuration: 0,
              navigationAnimContainerDuration: 0,
              navigationOffset: Offset.zero,
              navigationHeight: 100,
              appBarAnimDuration: 0,
              appBarOffset: Offset.zero,
              appBarHeight: 60,
              isTitleVisible: true,
            )
          );
        }
      }
    }
  }
}
