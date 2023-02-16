import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/pages/ar/ar.dart';
import '../../presentation/pages/overview/overview.dart';
import '../../presentation/pages/plans/plans.dart';
import '../../presentation/pages/project_info/project_info.dart';
part 'page_state.dart';

class PageCubit extends Cubit<PageState> {

  PageCubit() : super(
    PageState(
      pageIndex: 0,
      pages: [
        PageItem(
          index: 0,
          title: "Görünüş",
          route: OverviewPage.route,
          iconPath: "assets/images/app/navigation/overview_icon.png"
        ),
        PageItem(
          index: 1,
          title: "Planlar",
          route: PlansPage.route,
          iconPath: "assets/images/app/navigation/plan_images_icon.png"
        ),
        PageItem(
          index: 2,
          title: "Proje Bilgileri",
          route: ProjectInfoPage.route,
          iconPath: "assets/images/app/navigation/project_info_icon.png"
        ),
        PageItem(
          index: 3,
          title: "Arttırılmış Gerçeklik",
          route: ArPage.route,
          iconPath: "assets/images/app/navigation/ar_icon.png"
        ),
      ]
    )
  );

  void jumpTo(int pageIndex) {
    emit(PageState(pageIndex: pageIndex, pages: state.pages));
  }
}
