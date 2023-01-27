import 'package:flutter/material.dart';
import 'package:virtual_showroom/configs/app_space.dart';
import 'package:virtual_showroom/main/widget/my_footer.dart';
import 'package:virtual_showroom/main/widget/my_navigation_bar.dart';
import 'package:virtual_showroom/main/widget/my_page.dart';
import 'package:virtual_showroom/main/widget/my_app_bar.dart';
import 'package:virtual_showroom/main/widget/project_title.dart';
import '../configs/app_config.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {

    AppConfig.init(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          const MyAppBar(),
          AppSpace.verticalM!,
          const ProjectTitle(),
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                MyPage(pageIndex: _pageIndex),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: MyNavigationBar(
                    pageIndex: _pageIndex,
                    onPressed: (pageIndex) {
                      setState(() {
                        _pageIndex = pageIndex;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const MyFooter()
        ],
      )
    );
  }
}







