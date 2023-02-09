import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/configs/app_padding.dart';
import '../../../core/configs/app_text_style.dart';
import '../../../core/model/project.dart';
import '../../cubit/animation/animation_cubit.dart';
import 'dialog/custom_dialog.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({required this.project, Key? key}) : super(key: key);

  final Project project;

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
                    child: Image.asset(project.companyLogoPath),
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
                            return CustomDialog(
                              phone: project.companyPhone,
                              mail: project.companyMail,
                              address: project.companyAddress,
                              locationUrl: project.companyLocationUrl
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
