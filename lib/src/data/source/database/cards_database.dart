import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_boards_macos/src/data/model/local/card_model.dart';

class CardDatabase {
  final String boxName = "CardBox";

  Future<List<CardModel>> getCardsByProject({required int projectId}) async {
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

  Future<void> changeCard({
    required int key,
    required String note,
    required int projectId,
    required int categoryId,
  }) async {
    var box = await _getBox();
    box.put(
      key,
      CardModel(
        id: '',
        note: note,
        projectId: projectId,
        categoryId: categoryId,
      ),
    );
  }

  Future<void> delCard(int key) async {
    var box = await _getBox();
    if (box.containsKey(key)) {
      box.delete(key);
    }
  }

  Future<Box<CardModel>> _getBox() async {
    return await Hive.openBox<CardModel>(boxName);
  }
}
