import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:virtual_showroom/provider/app_state_provider.dart';
import 'package:virtual_showroom/provider/project_provider.dart';
import 'package:virtual_showroom/virtual_show_room/error_page.dart';
import 'package:virtual_showroom/virtual_show_room/virtual_show_room.dart';
import 'configs/core_theme.dart';


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
        ChangeNotifierProvider(create: (_) => ProjectProvider()),
      ],
      child: const MaterialChild()
    );
  }
}

class MaterialChild extends StatelessWidget {
  const MaterialChild({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final id = Uri.base.queryParameters["id"];
    if(id == null) {
      return const MaterialApp(
        home: ErrorPage(message: "Qr kod adresi yanlış, lütfen iletişime geçin. (id yok.)")
      );
    } else {
      final project = Provider.of<ProjectProvider>(context, listen: false).getProjectById(id);
      if(project == null) {
        return const MaterialApp(
          home: ErrorPage(message: "Qr kod adresi yanlış, lütfen iletişime geçin. (Böyle bir proje bulunamadı.)")
        );
      } else {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.trackpad,
              PointerDeviceKind.touch
            },
          ),
          title: 'Qr Projem - Virtual Showroom',
          theme: themeLight.copyWith(
            colorScheme: colorSchemeLight.copyWith(
              primary: Color(project.primaryColorValue)
            )
          ),
          darkTheme: themeDark.copyWith(
            colorScheme: colorSchemeDark.copyWith(
              primary: Color(project.primaryColorValue)
            )
          ),
          themeMode: ThemeMode.system,
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              builder: (context) {
                return VirtualShowRoom(project: project);
              },
            );
          },
        );
      }
    }
  }
}

// behavior: ScrollConfiguration.of(context).copyWith(
// dragDevices: {
// PointerDeviceKind.touch,
// PointerDeviceKind.mouse,
// },
// ),