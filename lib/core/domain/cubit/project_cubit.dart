import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_showroom/core/domain/repository/project_repository.dart';
import '../model/project.dart';

part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit(this._projectRepository) : super(ProjectState());

  final ProjectRepository _projectRepository;

  void fetchProjectById(String id) {
    _projectRepository.fetchProjectById(id)
      .then(
        (project) => emit(ProjectState(project: project))
      );
  }

  void postProjectForTest() {
    _projectRepository.postProjectForTest(Project.projects[0]);
  }
}
