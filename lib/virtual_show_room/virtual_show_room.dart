import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_showroom/virtual_show_room/cubit/animation/animation_cubit.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/custom_footer.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/custom_app_bar.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/navigation_bar/custom_navigation_bar.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/pages/current_page/current_page.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/pages/current_page/page_item.dart';
import 'package:virtual_showroom/virtual_show_room/presentation/project_title.dart';
import '../core/configs/app_config.dart';
import '../core/model/project.dart';
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
          create: (context) => AnimationCubit(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: BlocBuilder<PageCubit, PageState>(
          builder: (context, state) {
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
                  pages: PageItem.pages.where(
                    (page) => project.enabledPageRoutes.contains(page.route)
                  ).toList(),
                  project: project,
                  pageIndex: state.index
                ),
                CustomNavigationBar(
                  pages: PageItem.pages.where(
                    (page) => project.enabledPageRoutes.contains(page.route)
                  ).toList(),
                  pageIndex: state.index,
                  onPressed: (index) {
                    BlocProvider.of<PageCubit>(context, listen: false).jumpTo(index);
                  },
                ),
                const CustomFooter()
              ],
            );
          },
        )
      )
    );
  }
}







