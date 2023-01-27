import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem(
    {
      required this.imageUrl,
      required this.color,
      required this.fit,
      Key? key
    }
  ) : super(key: key);

  final String imageUrl;
  final Color? color;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(imageUrl, fit: fit),
      ),
    );
  }
}
