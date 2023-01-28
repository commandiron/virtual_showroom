import 'package:flutter/material.dart';

class CarouselItem extends StatefulWidget {
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
  State<CarouselItem> createState() => _CarouselItemState();
}

class _CarouselItemState extends State<CarouselItem> {

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onBackground,
      shadowColor: widget.shadowColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(widget.imagePath, fit: widget.fit)
      ),
    );
  }
}