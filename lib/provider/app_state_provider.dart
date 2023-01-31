import 'package:flutter/cupertino.dart';

class AppStateProvider extends ChangeNotifier {

  ScreenState _screenState = ScreenState.animatedCollapsed;

  ScreenState get screenState => _screenState;

  setScreenStateExpanded({bool isAnimated = false}) {
    if(isAnimated) {
      _screenState = ScreenState.animatedExpanded;
    } else {
      _screenState = ScreenState.expanded;
    }
    notifyListeners();
  }
  setScreenStateCollapsed() {
    _screenState = ScreenState.animatedCollapsed;
    notifyListeners();
  }
}

enum ScreenState {
  animatedCollapsed,
  expanded,
  animatedExpanded,
}
