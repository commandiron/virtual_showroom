import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_showroom/core/domain/cubit/project_state.dart';
import 'package:virtual_showroom/core/domain/repository/project_repository.dart';
import '../model/project.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit(this._projectRepository) : super(ProjectInitial());

  final ProjectRepository _projectRepository;

  void fetchProjectById(String id) async {
    try {
      emit(ProjectLoading());
      final project = await _projectRepository.fetchProjectById(id);
      emit(ProjectCompleted(project));
    } catch (e) {
      emit(const ProjectError("Couldn't get response"));
    }
  }

  void postProjectForTest() {
    _projectRepository.postProjectForTest(Project.projects[0]);
  }
}
