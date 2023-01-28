import 'package:flutter/cupertino.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewProvider extends ChangeNotifier {
  final PhotoViewScaleStateController _controller= PhotoViewScaleStateController();
  PhotoViewScaleStateController get scaleStateController => _controller;
}
