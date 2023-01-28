import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:virtual_showroom/main/widget/my_footer.dart';
import 'package:virtual_showroom/main/widget/my_navigation_bar.dart';
import 'package:virtual_showroom/main/widget/my_page.dart';
import 'package:virtual_showroom/main/widget/my_app_bar.dart';
import 'package:virtual_showroom/main/widget/project_title.dart';
import '../configs/app_config.dart';
import '../provider/photo_view_scale_state_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {

    final photoViewScaleState = Provider.of<PhotoViewScaleStateProvider>(context).photoViewScaleState;

    AppConfig.init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          const MyAppBar(),
          const ProjectTitle(),
          MyPage(pageIndex: _pageIndex),
          if(photoViewScaleState == PhotoViewScaleState.initial)
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







