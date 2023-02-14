import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/presentation/config/app_padding.dart';
import '../../../core/presentation/config/app_text_style.dart';
import '../../../core/domain/model/project.dart';
import '../../cubit/animation/animation_cubit.dart';
import '../widget/dialog/custom_dialog.dart';

class ResponsiveCustomAppBar extends StatelessWidget {
  const ResponsiveCustomAppBar(
    {
      required this.project,
      required this.logoFlex,
      Key? key
    }
  ) : super(key: key);

  final Project project;
  final int logoFlex;

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
                  flex: logoFlex,
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
