import 'dart:convert';

import 'package:uuid/uuid.dart';
import 'package:virtual_showroom/core/domain/model/project.dart';
import 'package:virtual_showroom/core/domain/repository/project_repository.dart';
import 'package:http/http.dart' as http;

class ProjectRepositoryImpl extends ProjectRepository {
  
  final String databaseUrl = "https://qr-projem-default-rtdb.europe-west1.firebasedatabase.app/projects";
  
  @override
  Future<Project> fetchProjectById(String id) {
    throw UnimplementedError();
  }

  @override
  void postProjectForTest(Project project) {
    final uuid = const Uuid().v4();
    final databaseUri = Uri.parse(databaseUrl +"/$uuid.json");
    http.put(
      databaseUri,
      body: json.encode(
        project.toJson()
      )
    );
  }
}