import 'package:hive/hive.dart';

part 'card_model.g.dart';

@HiveType(typeId: 1)
class CardModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String note;

  @HiveField(2)
  int categoryId;

  @HiveField(3)
  int projectId;

  CardModel({
    required this.id,
    required this.note,
    required this.categoryId,
    required this.projectId,
  });
}
