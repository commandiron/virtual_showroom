import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:virtual_showroom/provider/app_state_provider.dart';
import 'package:virtual_showroom/virtual_show_room/virtual_show_room.dart';
import 'configs/core_theme.dart';
import 'model/project.dart';


void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppStateProvider()),
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
      themeMode: ThemeMode.system,
      initialRoute: "/",
      routes: {
        "/": (context) => VirtualShowRoom(project: Project.testProject),
      },
    );
  }
}