import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem(
    {
      required this.imageUrl,
      Key? key
    }
  ) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}
