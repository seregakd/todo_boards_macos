import 'package:hive/hive.dart';

part 'project_model.g.dart';

@HiveType(typeId: 2)
class ProjectModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  ProjectModel({
    this.id = '',
    required this.name,
  });
}