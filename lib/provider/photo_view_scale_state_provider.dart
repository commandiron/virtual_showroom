import 'package:flutter/cupertino.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewScaleStateProvider extends ChangeNotifier {
  PhotoViewScaleState _photoViewScaleState = PhotoViewScaleState.initial;

  PhotoViewScaleState get photoViewScaleState => _photoViewScaleState;

  setPhotoViewScaleState(PhotoViewScaleState photoViewScaleState) {
    _photoViewScaleState = photoViewScaleState;
    notifyListeners();
  }
}
