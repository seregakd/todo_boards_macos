import 'package:hive/hive.dart';

part 'project_model.g.dart';

@HiveType(typeId: 2)
class ProjectModel extends HiveObject {
  @HiveField(0)
  String name;

  ProjectModel({
    required this.name,
  });
}