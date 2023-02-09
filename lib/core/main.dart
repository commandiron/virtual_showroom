import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:virtual_showroom/core/error_screen.dart';
import 'package:virtual_showroom/virtual_show_room/virtual_show_room.dart';
import 'configs/core_theme.dart';
import 'cubit/project/project_cubit.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProjectCubit>(
      create: (context) => ProjectCubit(),
      child: const MaterialChild(),
    );
  }
}

class MaterialChild extends StatelessWidget {
  const MaterialChild({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    // final id = Uri.base.queryParameters["id"];
    final id = "0"; //For Test

    if(id == null) {
      return const MaterialApp(
        home: ErrorScreen(message: "Qr kod adresi yanlış, lütfen iletişime geçin. (id yok.)")
      );
    }

    BlocProvider.of<ProjectCubit>(context).fetchProjectById(id);

    return BlocBuilder<ProjectCubit, ProjectState>(
      builder: (context, state) {
        final project = state.project;
        if(project == null) {
          return const MaterialApp(
            home: ErrorScreen(message: "Qr kod adresi yanlış, lütfen iletişime geçin. (Böyle bir proje bulunamadı.)")
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
      },
    );
  }
}