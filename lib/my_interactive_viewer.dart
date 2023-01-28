import 'package:flutter/material.dart';

class MyInteractiveViewer extends StatefulWidget {
  const MyInteractiveViewer({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  State<MyInteractiveViewer> createState() => _MyInteractiveViewerState();
}

class _MyInteractiveViewerState extends State<MyInteractiveViewer> with SingleTickerProviderStateMixin{

  late TransformationController _controller;
  late AnimationController _animationController;
  Animation<Matrix4>? _animation;

  @override
  void initState() {
    _controller = TransformationController();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200)
    )..addListener(() => _controller.value = _animation!.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      transformationController: _controller,
      maxScale: 4,
      minScale: 1,
      onInteractionEnd: (details) {
        resetAnimation();
      },
      child: widget.child
    );
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
