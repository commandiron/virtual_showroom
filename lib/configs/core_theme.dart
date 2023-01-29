import 'package:flutter/material.dart';

final colorSchemeDark = ColorScheme.dark(
  primary: Color(0xff137CC0),
  onPrimary: Colors.white,

  background: Color(0xff242424),
  onBackground: Colors.white,

  primaryContainer: Colors.grey.shade50,
  onPrimaryContainer: Colors.black,

  secondaryContainer: Color(0xff242424),
  onSecondaryContainer: Colors.white,
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
  primary: Color(0xff137CC0),
  onPrimary: Colors.white,

  background: Colors.white,
  onBackground: Color(0xff242424),

  primaryContainer: Colors.grey.shade200,
  onPrimaryContainer: Colors.black,

  secondaryContainer:Colors.grey.shade200,
  onSecondaryContainer: Colors.black,
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
