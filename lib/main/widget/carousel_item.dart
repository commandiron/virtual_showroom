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
        child: Image.asset(imagePath, fit: fit),
      ),
    );
  }
}
