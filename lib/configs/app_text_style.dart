import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle? btn;

  // Headings
  static TextStyle? h1;
  static TextStyle? h1b;
  static TextStyle? h2;
  static TextStyle? h2b;
  static TextStyle? h3;
  static TextStyle? h3b;

  // Body
  static TextStyle? b1;
  static TextStyle? b1b;
  static TextStyle? b2;
  static TextStyle? b2b;
  static TextStyle? b3;
  static TextStyle? b3b;

  // Label
  static TextStyle? l1;
  static TextStyle? l1c;
  static TextStyle? l1b;
  static TextStyle? l2;
  static TextStyle? l2b;

  static init(BuildContext context) {

    final baseStyle = GoogleFonts.roboto();
    final color = Theme.of(context).colorScheme.onBackground;
    const bold = FontWeight.bold;

    h1 = baseStyle.copyWith(fontSize: 36, color: color);
    h1b = h1!.copyWith(fontWeight: bold);

    h2 = baseStyle.copyWith(fontSize: 22, color: color);
    h2b = h2!.copyWith(fontWeight: bold);

    h3 = baseStyle.copyWith(fontSize: 18, color: color);
    h3b = h3!.copyWith(fontWeight: bold);

    b1 = baseStyle.copyWith(fontSize: 16, color: color);
    b1b = b1!.copyWith(fontWeight: bold);

    b2 = baseStyle.copyWith(fontSize: 14, color: color);
    b2b = b2!.copyWith(fontWeight: bold);

    b3 = baseStyle.copyWith(fontSize: 12, color: color);
    b3b = b3!.copyWith(fontWeight: bold);

    l1 = baseStyle.copyWith(fontSize: 10, color: color);
    l1b = l1!.copyWith(fontWeight: bold);

    l2 = baseStyle.copyWith(fontSize: 8, color: color);
    l2b = l2!.copyWith(fontWeight: bold);
  }
}
