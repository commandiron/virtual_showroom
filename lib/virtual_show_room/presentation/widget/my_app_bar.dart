import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/configs/app_padding.dart';
import '../../../core/configs/app_text_style.dart';
import '../../../core/model/project.dart';
import '../../cubit/animation/animation_cubit.dart';
import 'dialog/app_dialog.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar(
    {
      required this.project,
      Key? key
    }
  ) : super(key: key);

  final Project project;

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimationCubit, AnimationState>(
      builder: (context, state) {
        return AnimatedSlide(
          offset: state.appBarOffset,
          duration: Duration(milliseconds: state.appBarAnimDuration),
          child: AnimatedContainer(
            duration: Duration(milliseconds: state.appBarAnimDuration),
            height: state.appBarHeight,
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: AppPadding.horizontalM!.add(AppPadding.verticalS!),
                    alignment: Alignment.centerLeft,
                    child: Image.asset(widget.project.companyLogoPath),
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
                            return AppDialog(
                              phone: widget.project.companyPhone,
                              mail: widget.project.companyMail,
                              address: widget.project.companyAddress,
                              locationUrl: widget.project.companyLocationUrl
                            );
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
      },
    );
  }
}
