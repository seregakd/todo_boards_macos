import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:todo_boards_macos/src/data/model/local/card_model.dart';

class CardItem extends StatelessWidget {
  final CardModel card;
  final int categoryIndex;
  final VoidCallback onCardTapChange;
  final VoidCallback onCardTapDel;
  final VoidCallback onCardTapLeft;
  final VoidCallback onCardTapRight;

  const CardItem({
    Key? key,
    required this.card,
    required this.categoryIndex,
    required this.onCardTapChange,
    required this.onCardTapDel,
    required this.onCardTapLeft,
    required this.onCardTapRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 0.03),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: MacosColors.white,
            width: 0.2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (categoryIndex != 0)
                    MacosIconButton(
                      icon: const MacosIcon(
                        CupertinoIcons.left_chevron,
                      ),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(7),
                      onPressed: onCardTapLeft,
                    ),
                  if (categoryIndex == 0)
                    const SizedBox(
                      width: 30,
                    ),
                  MacosIconButton(
                    icon: const MacosIcon(
                      CupertinoIcons.pencil,
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(7),
                    onPressed: onCardTapChange,
                  ),
                  MacosIconButton(
                    icon: const MacosIcon(
                      CupertinoIcons.delete,
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(7),
                    onPressed: onCardTapDel,
                  ),
                  if (categoryIndex != 2)
                    MacosIconButton(
                      icon: const MacosIcon(
                        CupertinoIcons.right_chevron,
                      ),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(7),
                      onPressed: onCardTapRight,
                    ),
                  if (categoryIndex == 2)
                    const SizedBox(
                      width: 30,
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(card.note),
            ],
          ),
        ),
      ),
    );
  }
}
