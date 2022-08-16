import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_boards_macos/src/data/model/local/card_model.dart';

class CardDatabase {
  final String boxName = "CardBox";

  Future<List<CardModel>> getCardsByProject(int projectId) async {
    var box = await _getBox();
    return box.values
        .where((element) => element.projectId == projectId)
        .toList();
  }

  Future<List<CardModel>> getCardsByProjectAndCategory({
    required int projectId,
    required int categoryId,
  }) async {
    var box = await _getBox();
    return box.values
        .where((element) =>
            element.projectId == projectId && element.categoryId == categoryId)
        .toList();
//    return box.values.toList();
  }

  Future<void> addCard({
    required String note,
    required int projectId,
    required int categoryId,
  }) async {
    var box = await _getBox();
    box.add(CardModel(
      id: '',
      note: note,
      projectId: projectId,
      categoryId: categoryId,
    ));
  }

  Future<void> changeCard(
    int index,
    String note,
    int projectId,
    int categoryId,
  ) async {
    var box = await _getBox();
    box.putAt(
      index,
      CardModel(
        id: '',
        note: note,
        projectId: projectId,
        categoryId: categoryId,
      ),
    );
  }

  Future<void> delCard(
    int index,
    int projectId,
    int categoryId,
  ) async {
    // var filteredUsers = userBox.values.where((user) => user.name.startsWith('s'));
    var box = await _getBox();
    box.deleteAt(index);
  }

  Future<Box<CardModel>> _getBox() async {
    return await Hive.openBox<CardModel>(boxName);
  }
}
