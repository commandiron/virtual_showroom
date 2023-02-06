import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

    // final id = Uri.base.queryParameters["id"]; //Bu şekilde kullanılacak şimdilik test için direk veriyorum.
    final id = "0";

    if(id == null) {
      return const MaterialApp(
        home: ErrorPage(message: "Qr kod adresi yanlış, lütfen iletişime geçin. (id yok.)")
      );
    }

    final project = Provider.of<ProjectProvider>(context, listen: false).getProjectById(id);
    if(project == null) {
      return const MaterialApp(
        home: ErrorPage(message: "Qr kod adresi yanlış, lütfen iletişime geçin. (Böyle bir proje bulunamadı.)")
      );
    }

    return MaterialApp.router(
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
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: "/",
            builder: (context, state) {
              return VirtualShowRoom(project: project);
            },
          )
        ]
      ),
    );
  }
}