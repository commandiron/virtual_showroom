import 'package:flutter/cupertino.dart';

class AppStateProvider extends ChangeNotifier {

  ScreenState _screenState = ScreenState.collapsed;

  ScreenState get screenState => _screenState;

  setScreenStateExpanded() {
    _screenState = ScreenState.expanded;
    notifyListeners();
  }
  setScreenStateCollapsed() {
    _screenState = ScreenState.collapsed;
    notifyListeners();
  }
}

enum ScreenState {
  collapsed,
  expanded,
}
