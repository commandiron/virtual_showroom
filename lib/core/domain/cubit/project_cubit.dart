import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_showroom/core/data/repository/project_repository_impl.dart';
import 'package:virtual_showroom/core/domain/cubit/project_state.dart';
import 'package:virtual_showroom/core/domain/repository/project_repository.dart';
import '../model/project.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit() : super(ProjectInitial());

  final ProjectRepository _projectRepository = ProjectRepositoryImpl();

  void fetchProjectById(String id) async {
    try {
      emit(ProjectLoading());
      await Future.delayed(Duration(seconds: 5));
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
