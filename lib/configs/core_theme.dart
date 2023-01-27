import 'package:flutter/material.dart';

final colorSchemeDark = ColorScheme.dark(
  primary: const Color(0xff137CC0),
  onPrimary: Colors.white,
  background: Color(0xff242424),
  onBackground: Colors.white,
  primaryContainer: Colors.white,
  onPrimaryContainer: Colors.grey
);

final themeDark = ThemeData(
  colorScheme: colorSchemeDark,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(colorSchemeDark.primary),
      foregroundColor: MaterialStateProperty.all(colorSchemeDark.onPrimary),
      padding: MaterialStateProperty.all(EdgeInsets.zero)
    )
  )
);

final colorSchemeLight = ColorScheme.light(
  primary: const Color(0xff137CC0),
  onPrimary: Colors.white,
  background: Colors.white,
  onBackground: Colors.black,
  primaryContainer: Color(0xff242424),
);

final themeLight = ThemeData(
  colorScheme: colorSchemeLight,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colorSchemeDark.primary),
        foregroundColor: MaterialStateProperty.all(colorSchemeDark.onPrimary),
        padding: MaterialStateProperty.all(EdgeInsets.zero)
      )
    )
);
