import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import 'widgets/card_item.dart';
import 'widgets/list_cards.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _pageIndex = 0;
  ScrollController controller1 = ScrollController();
  ScrollController controller2 = ScrollController();
  ScrollController controller3 = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MacosWindow(
      sidebar: _sidebar(),
      child: MacosScaffold(
        toolBar: _toolBar(),
        children: [
          ContentArea(
            builder: ((context, scrollController) {
              return Row(
                children: [
                  ListCards(
                    title: 'TODO',
                    count: 50,
                    controller: controller1,
                  ),
                  ListCards(
                    title: 'IN PROGRESS',
                    count: 10,
              //      controller: controller2,
                  ),
                  ListCards(
                    title: 'DONE',
                    count: 5,
              //      controller: controller3,
                  ),
                ],
              );
            }),
          ),

        ],
      ),
    );
  }

  Sidebar _sidebar() {
    return Sidebar(
      minWidth: 200,
      builder: (context, scrollController) {
        return SidebarItems(
          currentIndex: _pageIndex,
          onChanged: (index) {
            setState(() => _pageIndex = index);
          },
          items: const [
            SidebarItem(
              leading: MacosIcon(CupertinoIcons.home),
              label: Text('project 1'),
            ),
            SidebarItem(
              leading: MacosIcon(CupertinoIcons.search),
              label: Text('project 2'),
            ),
          ],
        );
      },
    );
  }

  ToolBar _toolBar() {
    return ToolBar(
      title: const Text('Toolbar'),
      titleWidth: 100.0,
      actions: [
        ToolBarIconButton(
          label: "Add",
          icon: const MacosIcon(
            CupertinoIcons.add_circled,
          ),
          onPressed: () => debugPrint("Add..."),
          showLabel: false,
        ),
        const ToolBarSpacer(),
        ToolBarIconButton(
          label: "Delete",
          icon: const MacosIcon(
            CupertinoIcons.trash,
          ),
          onPressed: () => debugPrint("Delete"),
          showLabel: false,
        ),
        ToolBarPullDownButton(
          label: "Actions",
          icon: CupertinoIcons.ellipsis_circle,
          items: [
            MacosPulldownMenuItem(
              label: "New Folder",
              title: const Text("New Folder"),
              onTap: () => debugPrint("Creating new folder..."),
            ),
            MacosPulldownMenuItem(
              label: "Open",
              title: const Text("Open"),
              onTap: () => debugPrint("Opening..."),
            ),
          ],
        ),
      ],
    );
  }
}
