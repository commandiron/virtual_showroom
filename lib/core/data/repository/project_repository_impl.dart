import 'dart:convert';

import 'package:virtual_showroom/core/domain/model/project.dart';
import 'package:virtual_showroom/core/domain/repository/project_repository.dart';
import 'package:http/http.dart' as http;

class ProjectRepositoryImpl extends ProjectRepository {
  final String databaseUrl =
      "https://qrprojem-default-rtdb.europe-west1.firebasedatabase.app/projects";

  @override
  Future<Project?> fetchProjectById(String uid, String id) async {
    final databaseUri = Uri.parse("$databaseUrl/$uid/$id.json");
    final response = await http.get(databaseUri);
    final data = json.decode(response.body) as Map<String, dynamic>;
    final project = Project.fromJson(data);
    return project;
  }
}
