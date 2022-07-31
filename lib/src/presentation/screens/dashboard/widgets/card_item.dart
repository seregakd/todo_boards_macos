import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

class CardItem extends StatelessWidget {
  final int index;
  const CardItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Text('Item $index'),
          const SizedBox(height: 8),
          MacosTextField(
            placeholder: 'Type text here',
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
