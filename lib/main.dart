import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_showroom/provider/photo_view_provider.dart';

import 'configs/core_theme.dart';
import 'main/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => PhotoViewProvider()),
        ],
        child: const MaterialChild()
    );
  }
}

class MaterialChild extends StatelessWidget {
  const MaterialChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Virtual Showroom',
      theme: themeLight,
      darkTheme: themeDark,
      themeMode: ThemeMode.dark,
      initialRoute: "/",
      routes: {
        "/": (context) => const MainScreen(),
      },
    );
  }
}