import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/project.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit() : super(ProjectState());

  void fetchProjectById(String id) {
    emit(ProjectState(project: Project.projects.firstWhereOrNull((project) => project.id == id)));
  }
}
