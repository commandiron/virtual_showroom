import 'package:flutter/material.dart';

final colorSchemeDark = ColorScheme.dark(
  primary: Color(0xff137CC0),
  onPrimary: Colors.white,

  background: Color(0xff242424),
  onBackground: Colors.white,

  primaryContainer: Colors.white,
  onPrimaryContainer: Color(0xffA1A1A1),

  secondaryContainer: Colors.grey.shade300,
  onSecondaryContainer: Colors.black
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

final colorSchemeLight = ColorScheme.dark(
  primary: Color(0xff137CC0),
  onPrimary: Colors.white,

  background: Colors.white,
  onBackground: Color(0xff242424),

  primaryContainer: Colors.white,
  onPrimaryContainer: Color(0xffA1A1A1),

  secondaryContainer: Colors.grey.shade300,
  onSecondaryContainer: Colors.black
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
