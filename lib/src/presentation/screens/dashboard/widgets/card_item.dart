import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:todo_boards_macos/src/data/model/local/card_model.dart';

class CardItem extends StatelessWidget {
  final CardModel card;
  const CardItem(this.card, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        children: [
//          const SizedBox(height: 8),
          Text(card.note),
//          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
