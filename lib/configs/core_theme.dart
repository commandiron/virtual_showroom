import 'package:flutter/material.dart';

final colorSchemeDark = ColorScheme.dark(
  primary: const Color(0xff137CC0),
  background: Color(0xff242424),
  onBackground: Colors.white,
  primaryContainer: Colors.white
);

final themeDark = ThemeData(
  colorScheme: colorSchemeDark,
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: colorSchemeDark.primaryContainer.withOpacity(0.75)
  )
);

final colorSchemeLight = ColorScheme.light(
  primary: const Color(0xff137CC0),
  background: Colors.white,
  onBackground: Colors.black,
  primaryContainer: Color(0xff242424),
);

final themeLight = ThemeData(
  colorScheme: colorSchemeLight,
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: colorSchemeLight.primaryContainer.withOpacity(0.85)
  )
);
