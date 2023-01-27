import 'package:flutter/material.dart';
import 'package:virtual_showroom/configs/app_space.dart';
import 'package:virtual_showroom/main/widget/my_footer.dart';
import 'package:virtual_showroom/main/widget/show_category_item.dart';
import 'package:virtual_showroom/main/widget/my_app_bar.dart';
import 'package:virtual_showroom/main/widget/project_title.dart';

import '../configs/app_config.dart';
import '../model/show_category.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {

    AppConfig.init(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            const MyAppBar(),
            AppSpace.verticalM!,
            const ProjectTitle(),
            AppSpace.verticalM!,
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.6,
              child: AnimatedSwitcher(
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                duration: const Duration(milliseconds: 600),
                child: ShowCategory.showCategories.elementAt(_currentPage).view
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: ShowCategory.showCategories.map(
                    (showCategory) => ShowCategoryItem(
                      showCategory: showCategory,
                      enabled: showCategory.pageIndex == _currentPage,
                      onPressed: () {
                        setState(() {
                          _currentPage = showCategory.pageIndex;
                        });
                      },
                    )
                  ).toList()
                ),
              ),
            ),
            const MyFooter()
          ],
        ),
      )
    );
  }
}







