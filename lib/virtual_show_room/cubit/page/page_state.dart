part of 'page_cubit.dart';

class PageState {
  int pageIndex;
  List<PageItem> pages;

  PageState(
    {
      required this.pageIndex,
      required this.pages
    }
  );
}

class PageItem {
  int index;
  String title;
  String route;
  String iconPath;

  PageItem(
    {
      required this.index,
      required this.title,
      required this.route,
      required this.iconPath,
    }
  );
}
