import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_boards_macos/src/data/model/local/project_model.dart';

class ProjectDatabase {
  final String boxName = "ProjectBox";

  Future<List<ProjectModel>> getProjects() async {
    var box = await _getBox();
    return box.values.toList();
  }

  Future<void> addProject(String name) async {
    var box = await _getBox();
    box.add(ProjectModel(
      name: name,
    ));
  }

  Future<void> changeProjectName(int index, String name) async {
    var box = await _getBox();
    box.putAt(
      index,
      ProjectModel(
        name: name,
      ),
    );
  }

  Future<void> delProject(int index) async {
    var box = await _getBox();
    box.deleteAt(index);
  }

  Future<Box<ProjectModel>> _getBox() async {
    return await Hive.openBox<ProjectModel>(boxName);
  }
}
