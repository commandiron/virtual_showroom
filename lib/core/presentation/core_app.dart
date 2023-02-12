import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:virtual_showroom/core/data/repository/project_repository_impl.dart';
import 'package:virtual_showroom/core/presentation/config/core_theme.dart';
import '../../virtual_show_room/virtual_show_room.dart';
import '../domain/cubit/project_cubit.dart';
import '../domain/cubit/project_state.dart';
import 'error_screen.dart';

class CoreApp extends StatelessWidget {
  const CoreApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProjectCubit>(
      create: (context) => ProjectCubit(ProjectRepositoryImpl()),
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

    if (id == null) {
      return const MaterialApp(home: ErrorScreen(errorCause: "id yok."));
    }

    BlocProvider.of<ProjectCubit>(context).fetchProjectById(id);

    return BlocBuilder<ProjectCubit, ProjectState>(
      builder: (context, state) {
        if (state is ProjectLoading) {
          //Showroom yükleniyor şeklinde loading screen yaz.
          return CircularProgressIndicator();
        } else if(state is ProjectCompleted){

          final project = state.response;

          if (project == null) {
            return MaterialApp(
                home: ErrorScreen(
                    errorCause: "Böyle bir proje bulunamadı. id:$id"));
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
            routerConfig: GoRouter(routes: [
              GoRoute(
                path: "/",
                builder: (context, state) {
                  return VirtualShowRoom(project: project);
                },
              )
            ]),
          );
        } else {
          final error = state as ProjectError;
          return MaterialApp(home: ErrorScreen(errorCause: error.message));
        }
      },
    );
  }
}
