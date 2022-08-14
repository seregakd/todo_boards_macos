import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:todo_boards_macos/src/data/model/local/project_model.dart';

import 'bloc/dashboard_bloc.dart';
import 'bloc/dashboard_models.dart';
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
    return BlocProvider(
      create: (_) => DashboardBloc()..add(GetInfoEvent()),
      child: BlocBuilder<DashboardBloc, DashboardScreenState>(
          builder: (context, state) {
        return MacosWindow(
          sidebar: _sidebar(context, state.projects),
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
      }),
    );
  }

  Sidebar _sidebar(BuildContext context, List<ProjectModel> projects) {
    return Sidebar(
      minWidth: 200,
      top: Column(
        children: [
          Row(
            children: [
              const Text('Projects'),
              const Spacer(),
              MacosIconButton(
                icon: const MacosIcon(
                  CupertinoIcons.add_circled,
                ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(7),
                onPressed: () {
                  context.read<DashboardBloc>().add(AddProjectEvent(
                        name: 'project $_pageIndex'));
                },
              ),
            ],
          ),
          const SizedBox(height: 8,),
        ],
      ),
      builder: (context, scrollController) {
        return SidebarItems(
          currentIndex: _pageIndex,
          onChanged: (index) {
            setState(() => _pageIndex = index);
          },
          items: [
            for (int i = 0; i < projects.length; i++)
              SidebarItem(
                leading: const MacosIcon(CupertinoIcons.home),
                label: Row(
                  children: [
                    Text(projects[i].name),
                    const SizedBox(width: 16,),
                    // MacosIconButton(
                    //   backgroundColor: Colors.white,
                    //   disabledColor: Colors.greenAccent,
                    //   hoverColor: Colors.redAccent,
                    //   icon: const MacosIcon(
                    //     CupertinoIcons.delete,
                    //     color: Colors.amber,
                    //   ),
                    //   shape: BoxShape.rectangle,
                    //   borderRadius: BorderRadius.circular(7),
                    //   onPressed: () {
                    //     // context.read<DashboardBloc>().del(AddProjectEvent(
                    //     //     name: 'project $_pageIndex'));
                    //   },
                    // ),
                  ],
                ),
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
