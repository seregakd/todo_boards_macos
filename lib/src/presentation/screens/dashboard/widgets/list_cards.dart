import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:todo_boards_macos/src/data/model/local/card_model.dart';
import 'package:todo_boards_macos/src/presentation/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:todo_boards_macos/src/presentation/screens/dashboard/bloc/dashboard_models.dart';
import 'card_item.dart';
import 'dialogs.dart';

class ListCards extends StatelessWidget {
  final ScrollController controller;
  final String title;
  final List<CardModel> cards;
  final VoidCallback onTapAdd;
  final int categoryIndex;
  final int projectId;
  final BuildContext context;

  const ListCards({
    Key? key,
    required this.title,
    required this.controller,
    required this.cards,
    required this.onTapAdd,
    required this.categoryIndex,
    required this.projectId,
    required this.context,
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
                  return CardItem(
                    card: cards[index],
                    categoryIndex: categoryIndex,
                    onCardTapChange: () => _changeCard(
                      cards[index],
                    ),
                    onCardTapDel: () => _delCard(
                      cardText: cards[index].note,
                      cardKey: cards[index].key,
                      categoryId: categoryIndex,
                    ),
                    onCardTapLeft: () => _moveCard(
                      card: cards[index],
                      moveLeft: true,
                    ),
                    onCardTapRight: () => _moveCard(
                      card: cards[index],
                      moveLeft: false,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _delCard({
    required String cardText,
    required int cardKey,
    required int categoryId,
  }) {
    Dialogs.showTextDialog(
      context: context,
      icon: const MacosIcon(
        CupertinoIcons.trash,
        size: 32,
      ),
      title: 'Warning',
      message: 'Do you want to delete card $cardText?',
      onTapYes: () {
        context.read<DashboardBloc>().add(DelCardEvent(
              key: cardKey,
              categoryId: categoryId,
            ));

        Navigator.of(context).pop();
      },
    );
  }

  void _changeCard(CardModel card) {
    TextEditingController controller = TextEditingController();
    controller.text = card.note;

    Dialogs.showEditTextDialog(
      context: context,
      icon: const MacosIcon(
        Icons.edit,
        size: 32,
      ),
      title: 'Change card',
      placeholder: 'Card name',
      controller: controller,
      onTapYes: () {
        if (controller.text.trim().isNotEmpty) {
          context.read<DashboardBloc>().add(
                ChangeCardEvent(
                  key: card.key,
                  note: controller.text,
                  projectId: projectId,
                  categoryId: categoryIndex,
                ),
              );
          Navigator.of(context).pop();
        }
      },
    );
  }

  void _moveCard({
    required CardModel card,
    required bool moveLeft,
  }) {
    context.read<DashboardBloc>().add(AddCardEvent(
      note: card.note,
      projectId: projectId,
      categoryId: moveLeft ? categoryIndex - 1 : categoryIndex + 1,
    ));
    context.read<DashboardBloc>().add(DelCardEvent(
      key: card.key,
      categoryId: categoryIndex,
    ));
  }
}
