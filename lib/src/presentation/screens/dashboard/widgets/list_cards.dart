import 'package:flutter/cupertino.dart';

import 'card_item.dart';

class ListCards extends StatelessWidget {
  final ScrollController? controller;
  final String title;
  final int count;

  const ListCards({
    Key? key,
    required this.title,
    this.controller,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          Text(title),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                controller: controller,
                shrinkWrap: true,
                itemCount: count,
                itemBuilder: (context, index) {
                  return CardItem(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
