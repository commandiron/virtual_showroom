import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({required this.message, Key? key}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(message, textAlign: TextAlign.center,),
      ),
    );
  }
}
