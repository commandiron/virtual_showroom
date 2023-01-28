import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_showroom/main/widget/my_app_bar.dart';
import 'package:virtual_showroom/main/widget/my_footer.dart';
import 'package:virtual_showroom/main/widget/my_navigation_bar.dart';
import 'package:virtual_showroom/main/widget/my_page.dart';
import 'package:virtual_showroom/main/widget/project_title.dart';
import '../configs/app_config.dart';
import '../provider/app_state_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {

    final screenState = Provider.of<AppStateProvider>(context).screenState;

    AppConfig.init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          const MyAppBar(),
          const ProjectTitle(),
          MyPage(pageIndex: _pageIndex),
          if(screenState == ScreenState.collapsed)
            MyNavigationBar(
              pageIndex: _pageIndex,
              onPressed: (pageIndex) {
                setState(() {
                  _pageIndex = pageIndex;
                });
              },
            ),
          const MyFooter()
        ],
      )
    );
  }
}







