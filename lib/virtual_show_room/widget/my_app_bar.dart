import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';
import '../../configs/app_padding.dart';
import '../../model/company_contact.dart';
import '../../provider/app_state_provider.dart';
import 'my_dialog.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar(
    {
      required this.companyLogoPath,
      required this.companyContacts,
      Key? key
    }
  ) : super(key: key);

  final String companyLogoPath;
  final List<CompanyContact> companyContacts;

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
                child: Image.asset(widget.companyLogoPath),
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
                        return MyDialog(companyContacts: widget.companyContacts,);
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
