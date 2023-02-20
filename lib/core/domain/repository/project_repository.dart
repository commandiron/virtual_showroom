import '../model/project.dart';

abstract class ProjectRepository {
  Future<Project?> fetchProjectById(String uid, String id);
}