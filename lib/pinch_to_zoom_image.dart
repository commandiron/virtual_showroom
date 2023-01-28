import 'package:flutter/material.dart';

class PinchToZoomImage extends StatefulWidget {
  const PinchToZoomImage({required this.imagePath, required this.fit, Key? key}) : super(key: key);

  final String imagePath;
  final BoxFit? fit;

  @override
  State<PinchToZoomImage> createState() => _PinchToZoomImageState();
}

class _PinchToZoomImageState extends State<PinchToZoomImage> with SingleTickerProviderStateMixin {

  late TransformationController _controller;
  late AnimationController _animationController;
  Animation<Matrix4>? _animation;

  final double _minScale = 1;
  final double _maxScale = 4;
  double _scale = 1;

  OverlayEntry? _entry;

  @override
  void initState() {
    _controller = TransformationController();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 200)
    )..addListener(() => _controller.value = _animation!.value
    )..addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        removeOverlay();
      }
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
    return buildImage(context);
  }

  Widget buildImage(BuildContext context) {
    return Builder(
        builder: (context) => InteractiveViewer(
            transformationController: _controller,
            clipBehavior: Clip.none,
            minScale: _minScale,
            maxScale: _maxScale,
            onInteractionStart: (details) {
              if(details.pointerCount < 2) return;
              showOverlay(context);
            },
            onInteractionUpdate: (details) {
              if(_entry == null) return;

              this._scale = details.scale;
              _entry!.markNeedsBuild();
            },
            onInteractionEnd: (details) {
              resetAnimation();
            },
            panEnabled: false,
            child: Image.asset(widget.imagePath, fit: widget.fit)
        )
    );
  }

  void showOverlay(BuildContext context) {
    final renderBox = context.findRenderObject()! as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = MediaQuery.of(context).size;

    _entry = OverlayEntry(
      builder: (context) {
        final opacity = ((_scale - 1) / (_maxScale - 1)).clamp(0.0, 1.0);
        return Stack(
            children: [
              Positioned.fill(
                  child: Opacity(
                    opacity: opacity,
                    child: Container(
                      color: Colors.black,
                    ),
                  )
              ),
              Positioned(
                  left: offset.dx,
                  top: offset.dy,
                  width: size.width,
                  child: buildImage(context)
              ),
            ]
        );
      },
    );

    final overlay = Overlay.of(context)!;
    overlay.insert(_entry!);
  }

  void removeOverlay() {
    _entry?.remove();
    _entry = null;
  }

  void resetAnimation() {
    _animation = Matrix4Tween(
      begin: _controller.value,
      end: Matrix4.identity(),
    ).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut
        )
    );

    _animationController.forward(from: 0);
  }
}