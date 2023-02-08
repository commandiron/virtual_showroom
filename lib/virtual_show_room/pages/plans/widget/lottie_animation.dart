import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatefulWidget {
  const LottieAnimation({Key? key}) : super(key: key);

  @override
  State<LottieAnimation> createState() => _LottieAnimationState();
}

class _LottieAnimationState extends State<LottieAnimation> with TickerProviderStateMixin  {

  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Center(
        child: Lottie.asset(
          "assets/lottie/zoom_in_animation_lottie.json",
          controller: _animationController,
          onLoaded: (composition) {
            _animationController
              ..duration = composition.duration
              ..forward();
          },
        ),
      ),
    );
  }
}
