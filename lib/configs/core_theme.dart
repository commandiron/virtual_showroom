import 'package:flutter/material.dart';

final colorSchemeDark = ColorScheme.dark(
  primary: const Color(0xffF48B0B),
  primaryContainer: const Color(0xff1F1F1F),
  onPrimaryContainer: Colors.white,
  secondaryContainer: const Color(0xff242424),
  onSecondaryContainer: Colors.grey.shade200
);

final themeDark = ThemeData(
  colorScheme: colorSchemeDark,
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: colorSchemeDark.primaryContainer.withOpacity(0.75)
  )
);

final colorSchemeLight = ColorScheme.light(
  primary: const Color(0xffF48B0B),
  primaryContainer: Colors.grey.shade50,
  onPrimaryContainer: Colors.black,
  secondaryContainer: Colors.grey.shade100,
  onSecondaryContainer: Colors.grey.shade800
);

final themeLight = ThemeData(
  colorScheme: colorSchemeLight,
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: colorSchemeLight.primaryContainer.withOpacity(0.85)
  )
);
