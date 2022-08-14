import 'package:todo_boards_macos/src/data/model/local/project_model.dart';
import 'package:todo_boards_macos/src/data/source/database/projects_database.dart';

class ProjectsRepository {
  final ProjectDatabase _projectsDatabase;

  ProjectsRepository(this._projectsDatabase);

  Future<List<ProjectModel>> getProjects() async {
    return await _projectsDatabase.getProjects();
  }

  Future<void> addProject(String name) async {
    await _projectsDatabase.addProject(name);
  }

  Future<void> changeProjectName(int index, String name) async {
    await _projectsDatabase.changeProjectName(index, name);
  }

  Future<void> delProject(int index) async {
    await _projectsDatabase.delProject(index);
  }

}