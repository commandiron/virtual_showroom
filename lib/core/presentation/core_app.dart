import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      create: (context) => ProjectCubit(),
      child: MaterialChild(
        projectId: Uri.base.queryParameters["id"],
      ),
    );
  }
}

class MaterialChild extends StatefulWidget {
  const MaterialChild({required this.projectId, Key? key}) : super(key: key);

  final String? projectId;

  @override
  State<MaterialChild> createState() => _MaterialChildState();
}

class _MaterialChildState extends State<MaterialChild> {

  @override
  void initState() {
    if(widget.projectId != null) {
      BlocProvider.of<ProjectCubit>(context).fetchProjectById(widget.projectId!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if (widget.projectId == null) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/" : (context) {
            return const ErrorScreen(errorCause: "id yok.");
          }
        },
      );
    }

    return BlocBuilder<ProjectCubit, ProjectState>(
      builder: (context, state) {
        if (state is ProjectLoading) {
          return const SizedBox.shrink();
        } else if(state is ProjectCompleted){

          final project = state.response;

          if (project == null) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              routes: {
                "/?id=${widget.projectId}" : (context) {
                  return ErrorScreen(errorCause: "Böyle bir proje bulunamadı. id:${widget.projectId}");
                }
              },
            );
          }

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
            initialRoute: "/?id=${widget.projectId}",
            routes: {
              "/?id=${widget.projectId}" : (context) {
                return VirtualShowRoom(project: project);
              }
            },
          );
        } else {
          final error = state as ProjectError;
          return MaterialApp(
            routes: {
              "/?id=${widget.projectId}" : (context) {
                return ErrorScreen(errorCause: error.message);
              }
            },
          );
        }
      },
    );
  }
}
