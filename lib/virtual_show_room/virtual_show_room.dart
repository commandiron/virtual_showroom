import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_showroom/virtual_show_room/cubit/screen/screen_cubit.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/app_bar/custom_app_bar.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/custom_footer.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/navigation_bar/custom_navigation_bar.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/pages/current_page.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/project_title.dart';
import '../core/domain/model/project.dart';
import '../core/presentation/config/app_config.dart';
import 'cubit/page/page_cubit.dart';

class VirtualShowRoom extends StatelessWidget {
  const VirtualShowRoom({required this.project, Key? key}) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {

    AppConfig.init(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => ScreenCubit(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: BlocBuilder<PageCubit, PageState>(
          builder: (context, state) {
            return OrientationBuilder(
              builder: (context, orientation) {
                BlocProvider.of<ScreenCubit>(context, listen: false).setOrientation(orientation);
                return Column(
                  children: [
                    CustomAppBar(
                      project: project,
                    ),
                    ProjectTitle(
                      title: project.name,
                      locationUrl: project.locationUrl,
                    ),
                    CurrentPage(
                        pages: state.pages.where(
                                (page) => project.enabledPageRoutes.contains(page.route)
                        ).toList(),
                        project: project,
                        pageIndex: state.pageIndex
                    ),
                    CustomNavigationBar(
                      pages: state.pages.where(
                        (page) => project.enabledPageRoutes.contains(page.route)
                      ).toList(),
                      pageIndex: state.pageIndex,
                      onPressed: (index) {
                        BlocProvider.of<PageCubit>(context, listen: false).jumpTo(index);
                      },
                    ),
                    const CustomFooter()
                  ],
                );
              },
            );
          },
        )
      )
    );
  }
}







