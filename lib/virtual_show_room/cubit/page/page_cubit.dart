import 'package:flutter_bloc/flutter_bloc.dart';
part 'page_state.dart';

class PageCubit extends Cubit<PageState> {
  PageCubit() : super(PageState(index: 0));

  void jumpTo(int pageIndex) {
    emit(PageState(index: pageIndex));
  }
}
