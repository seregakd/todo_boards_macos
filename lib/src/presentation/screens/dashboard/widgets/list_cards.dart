import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:todo_boards_macos/src/data/model/local/card_model.dart';
import 'card_item.dart';

class ListCards extends StatelessWidget {
  final ScrollController controller;
  final String title;
  final List<CardModel> cards;
  final VoidCallback onTapAdd;

  const ListCards({
    Key? key,
    required this.title,
    required this.controller,
    required this.cards,
    required this.onTapAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                MacosIconButton(
                  icon: const MacosIcon(
                    CupertinoIcons.add_circled,
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(7),
                  onPressed: onTapAdd,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              controller: controller,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return CardItem(cards[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
