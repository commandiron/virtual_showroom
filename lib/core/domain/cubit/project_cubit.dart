import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_showroom/core/domain/repository/project_repository.dart';
import '../model/project.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit(this._projectRepository) : super(ProjectState());

  final ProjectRepository _projectRepository;

  void fetchProjectById(String id) {
    emit(ProjectState(project: Project.projects.firstWhereOrNull((project) => project.id == id)));
  }

  void postProjectForTest() {
    _projectRepository.postProjectForTest(Project.projects[0]);
  }
}
