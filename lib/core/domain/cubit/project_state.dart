import '../model/project.dart';

abstract class ProjectState {
  const ProjectState();
}

class ProjectInitial extends ProjectState {
  ProjectInitial();
}

class ProjectLoading extends ProjectState {
  ProjectLoading();
}

class ProjectCompleted extends ProjectState {
  final Project? response;

  ProjectCompleted(this.response);
}

class ProjectError extends ProjectState {
  final String message;
  const ProjectError(this.message);
}
