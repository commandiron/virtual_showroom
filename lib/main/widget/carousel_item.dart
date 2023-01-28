import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem(
    {
      required this.imagePath,
      required this.color,
      this.shadowColor,
      required this.fit,
      Key? key
    }
  ) : super(key: key);

  final String imagePath;
  final Color? color;
  final Color? shadowColor;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onBackground,
      shadowColor: shadowColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(imagePath, fit: fit)
      ),
    );
  }
}

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

