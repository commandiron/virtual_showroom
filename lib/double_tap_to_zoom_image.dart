import 'package:flutter/material.dart';

class DoubleTapToZoomImage extends StatefulWidget {
  const DoubleTapToZoomImage({required this.imagePath, required this.fit, Key? key}) : super(key: key);

  final String imagePath;
  final BoxFit? fit;

  @override
  State<DoubleTapToZoomImage> createState() => _DoubleTapToZoomImageState();
}

class _DoubleTapToZoomImageState extends State<DoubleTapToZoomImage> with SingleTickerProviderStateMixin {

  late TransformationController _controller;
  TapDownDetails? tapDownDetails;

  late AnimationController _animationController;
  Animation<Matrix4>? animation;

  @override
  void initState() {
    _controller = TransformationController();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300)
    )..addListener(() {
      _controller.value = animation!.value;
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTapDown: (details) {
        tapDownDetails = details;
      },
      onDoubleTap: () {
        final position = tapDownDetails!.localPosition;

        const double scale = 3;

        final x = -position.dx * (scale - 1);
        final y = -position.dy * (scale - 1);

        final zoomed = Matrix4.identity()
          ..translate(x,y)
          ..scale(scale);

        final end = _controller.value.isIdentity() ? zoomed : Matrix4.identity();

        animation = Matrix4Tween(
          begin: _controller.value,
          end: end,
        ).animate(
            CurveTween(curve: Curves.easeInOut).animate(_animationController)
        );

        _animationController.forward(from: 0);
      },
      child: InteractiveViewer(
          transformationController: _controller,
          panEnabled: false,
          scaleEnabled: false,
          child: Image.asset(widget.imagePath, fit: widget.fit)
      ),
    );
  }
}