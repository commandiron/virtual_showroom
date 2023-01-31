import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../model/project.dart';

class ProjectProvider extends ChangeNotifier {
  Project? getProjectById(String id) {
    return Project.projects.firstWhereOrNull((project) => project.id == id);
  }
}
