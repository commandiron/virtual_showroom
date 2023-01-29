import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';
import 'package:virtual_showroom/main/widget/my_dialog.dart';

import '../../configs/app_padding.dart';
import '../../model/project.dart';
import '../../provider/app_state_provider.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {

  Offset _offset = Offset.zero;
  double _height = 60;

  @override
  Widget build(BuildContext context) {

    final screenState = Provider.of<AppStateProvider>(context).screenState;

    if(screenState == ScreenState.collapsed) {
      setState(() {
        _offset = Offset.zero;
        _height = 60;
      });
    } else {
      setState(() {
        _offset = Offset(0, -1);
        _height = 0;
      });
    }

    return AnimatedSlide(
      offset: _offset,
      duration: Duration(milliseconds: _offset == Offset.zero ? 600 : 0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: _offset == Offset.zero ? 300 : 0),
        height: _height,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: AppPadding.horizontalM!.add(AppPadding.verticalS!),
                alignment: Alignment.centerLeft,
                child: Image.asset(Project.project1.companyImagePath),
              )
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: CupertinoButton(
                  padding: AppPadding.zero,
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const MyDialog();
                      },
                    );
                  },
                  child: FittedBox(
                    child: Text(
                      "İletişim",
                      style: AppTextStyle.b2?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary
                      )
                    )
                  )
                ),
              )
            ),
          ],
        )
      ),
    );
  }
}
