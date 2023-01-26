import 'package:flutter/material.dart';

class AppSpace {
  static Widget? horizontalS;
  static Widget? horizontalM;
  static Widget? horizontalL;
  static Widget? horizontalXL;
  static Widget? horizontalXXL;
  static Widget? horizontalXXXL;
  static Widget? verticalS;
  static Widget? verticalM;
  static Widget? verticalL;
  static Widget? verticalXL;
  static Widget? verticalXXL;
  static Widget? verticalXXXL;
  static Widget? horizontalExpanded;
  static Widget? verticalExpanded;

  static void init() {
    horizontalS = const SizedBox(width: 4);
    horizontalM = const SizedBox(width: 8);
    horizontalL = const SizedBox(width: 16);
    horizontalXL = const SizedBox(width: 32);
    horizontalXXL = const SizedBox(width: 64);
    horizontalXXL = const SizedBox(width: 128);

    verticalS = const SizedBox(height: 4);
    verticalM = const SizedBox(height: 8);
    verticalL = const SizedBox(height: 16);
    verticalXL = const SizedBox(height: 32);
    verticalXXL = const SizedBox(height: 64);
    verticalXXXL = const SizedBox(height: 128);

    horizontalExpanded = const Expanded(child: SizedBox(width: double.infinity));
    verticalExpanded = const Expanded(child: SizedBox(height: double.infinity));
  }
}
