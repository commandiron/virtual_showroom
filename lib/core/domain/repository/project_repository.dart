import '../model/project.dart';

abstract class ProjectRepository {
  Future<Project> fetchProjectById(String id);
  void postProjectForTest(Project project);
}