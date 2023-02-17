import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_showroom/virtual_show_room/cubit/screen/screen_cubit.dart';
import '../../core/presentation/config/app_text_style.dart';
import '../../core/presentation/helper/url_launcher.dart';

class ProjectTitle extends StatelessWidget {
  const ProjectTitle({required this.title, required this.locationUrl, Key? key}) : super(key: key);

  final String title;
  final String locationUrl;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenCubit, ScreenState>(
      builder: (context, state) {
        return Container(
          height: state.isTitleVisible ? 49 : 0,
          alignment: Alignment.center,
          child: FittedBox(
            child: Row(
              children: [
                const SizedBox(
                  width: 24,
                ),
                Text(
                  title,
                  style: AppTextStyle.h3
                ),
                InkWell(
                  onTap: () {
                    openURL(locationUrl);
                  },
                  child: Icon(
                    Icons.location_on,
                    color: Theme.of(context).colorScheme.primary,
                    size: 24,
                  )
                ),
              ],
            ),
          )
        );
      },
    );
  }
}
