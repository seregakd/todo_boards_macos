import 'package:todo_boards_macos/src/data/model/local/card_model.dart';
import 'package:todo_boards_macos/src/data/source/database/cards_database.dart';

class CardRepository {
  final CardDatabase _cardDatabase;

  CardRepository(this._cardDatabase);

  Future<List<CardModel>> getCardsByProjectAndCategory({
    required int projectId,
    required int categoryId,
  }) async {
    return await _cardDatabase.getCardsByProjectAndCategory(
      projectId: projectId,
      categoryId: categoryId,
    );
  }

  Future<void> addCard({
    required String note,
    required int projectId,
    required int categoryId,
  }) async {
    await _cardDatabase.addCard(
      note: note,
      projectId: projectId,
      categoryId: categoryId,
    );
  }

// Future<void> changeProjectName(int index, String name) async {
//   await _cardDatabase.changeProjectName(index, name);
// }
//
// Future<void> delProject(int index) async {
//   await _cardDatabase.delProject(index);
// }
}
